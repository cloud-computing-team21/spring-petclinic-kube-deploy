{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}


{{- define "app.spring_petclinic_rest.name" -}}
    {{- if .Values.nameSuffix -}}
        {{ if eq .Values.nameSuffix "ignore" }}
            {{- printf "%s" .Values.spring_petclinic_rest.name | trunc 63 | trimSuffix "-" -}}
        {{- else -}}
            {{- printf "%s-%s" .Values.spring_petclinic_rest.name .Values.nameSuffix | trunc 63 | trimSuffix "-" -}}
        {{- end -}}    
    {{- else -}}
        {{- printf "%s" .Values.spring_petclinic_rest.name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}    
{{- end -}}

{{- define "app.spring_petclinic_rest.host.name" -}}
    {{- if .Values.nameSuffix -}}
         {{ if eq .Values.nameSuffix "ignore" }}
            {{- printf "%s" .Values.spring_petclinic_rest.name | trunc 63 | trimSuffix "-" -}}
         {{- else -}}
            {{- printf "%s-%s" .Values.spring_petclinic_rest.name .Values.backend.nameSuffix | trunc 63 | trimSuffix "-" -}}
         {{- end -}}            
    {{- else -}}
        {{- printf "%s" .Values.spring_petclinic_rest.name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}    
{{- end -}}


{{- define "app.spring_petclinic_rest.config.name" -}}
    {{- if .Values.spring_petclinic_rest.config.name -}}
        {{- printf "%s" .Values.spring_petclinic_rest.config.name | trunc 63 | trimSuffix "-" -}}        
    {{- else -}}
        {{- printf "%s" "environment.js" | trunc 63 | trimSuffix "-" -}}
    {{- end -}}    
{{- end -}}


{{- define "app.labels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/instance: {{ include "app.name" . }}
app.kubernetes.io/version: {{.Chart.AppVersion}}
app.kubernetes.io/component: {{ .Values.backend.name }}
app.kubernetes.io/part-of: {{ .Values.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}