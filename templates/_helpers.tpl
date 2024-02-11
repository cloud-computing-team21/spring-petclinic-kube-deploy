{{/* vim: set filetype=mustache: */}}


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

