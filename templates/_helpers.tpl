{{- define "nextjs.fullname" -}}
    {{ .Release.Name }}-{{ .Values.name | default .Chart.Name }}
{{- end -}}

{{- define "nextjs.traefik.path" -}}
    {{ if .Values.routing.path }} && PathPrefix(`{{ .Values.routing.path }}`){{ end }}
{{- end -}}

{{- define "nextjs.routing.type" -}}
{{ if .Values.global.routing.type }}{{ .Values.global.routing.type }}{{ else }}{{ .Values.routing.type }}{{ end }}
{{- end -}}

{{- define "nextjs.routing.service" -}}
    {{- if .Values.routing.service.name -}}
        {{- .Values.routing.service.name -}}
    {{- else if .Values.service.name -}}
        {{- .Values.service.name -}}
    {{- else -}}
        {{- template "nextjs.fullname" $ }}
    {{- end -}}
{{- end -}}

{{- define "nextjs.labels.common" -}}
version: {{ .Values.version | default .Values.image.tag | quote }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/name: {{ template "nextjs.fullname" $ }}
{{- end -}}

