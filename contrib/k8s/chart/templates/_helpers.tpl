{{/*
Expand the name of the chart.
*/}}
{{- define "gas-city.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name. Truncated to 63 chars (DNS limit).
If the release name already contains the chart name, omit the suffix.
*/}}
{{- define "gas-city.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := .Chart.Name }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Chart label value (name-version, + replaced with _).
*/}}
{{- define "gas-city.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels applied to every resource.
*/}}
{{- define "gas-city.labels" -}}
helm.sh/chart: {{ include "gas-city.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: gas-city
{{ include "gas-city.selectorLabels" . }}
{{- end }}

{{/*
Selector labels (stable subset used in matchLabels and Service selectors).
*/}}
{{- define "gas-city.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gas-city.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Per-component resource name helpers.
*/}}
{{- define "gas-city.doltName" -}}
{{- printf "%s-dolt" (include "gas-city.fullname" .) }}
{{- end }}

{{- define "gas-city.mailName" -}}
{{- printf "%s-mail" (include "gas-city.fullname" .) }}
{{- end }}

{{- define "gas-city.agentSAName" -}}
{{- printf "%s-agent" (include "gas-city.fullname" .) }}
{{- end }}

{{- define "gas-city.controllerSAName" -}}
{{- printf "%s-controller" (include "gas-city.fullname" .) }}
{{- end }}

{{- define "gas-city.eventCleanupName" -}}
{{- printf "%s-event-cleanup" (include "gas-city.fullname" .) }}
{{- end }}
