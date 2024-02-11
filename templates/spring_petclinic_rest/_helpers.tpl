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



{{- define "global.configmap" -}}
- name: GLOBAL_ENV_NAME
  valueFrom:
    configMapKeyRef:
      name: global-environment-configmap
      key: envName
- name: GLOBAL_ENV_DOMAIN
  valueFrom:
    configMapKeyRef:
      name: global-environment-configmap
      key: envDomain
- name: GLOBAL_ELK_HOST
  valueFrom:
    configMapKeyRef:
      name: global-environment-configmap
      key: elkHost
- name: GLOBAL_ELK_PORT
  valueFrom:
    configMapKeyRef:
      name: global-environment-configmap
      key: elkPort	  
- name: GLOBAL_ELK_HOST_DW
  valueFrom:
    configMapKeyRef:
      name: global-environment-configmap
      key: elkHostDW
- name: GLOBAL_ELK_PORT_DW
  valueFrom:
    configMapKeyRef:
      name: global-environment-configmap
      key: elkPortDW
- name: GLOBAL_POSTGRES_HOST
  valueFrom:
    configMapKeyRef:
      name: global-environment-configmap
      key: postgresHost     	  	  
{{- end -}}


{{- define "app.labels" -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/instance: {{ include "app.name" . }}
app.kubernetes.io/version: {{.Chart.AppVersion}}
app.kubernetes.io/component: {{ .Values.backend.name }}
app.kubernetes.io/part-of: {{ .Values.name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Determine Ingress API Version */}}
{{- define "aquacloud.ingress.apiVersion" -}}
  {{- if (.Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress") -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}


{{/* Check Ingress stability */}}
{{- define "aquacloud.ingress.isStable" -}}
  {{- eq (include "aquacloud.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}
