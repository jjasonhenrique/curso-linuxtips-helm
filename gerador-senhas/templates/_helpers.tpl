{{/*
Criar as nossas tags
*/}}
{{- define "app.labels" -}}
app: {{ .labels.app | quote }}
env: {{ .labels.env | quote }}
live: {{ .labels.live | quote }}
{{- end }}

{{/*
Definir os limites de recursos
*/}}
{{- define "app.resources" -}}
requests:
  memory: {{ .resources.requests.memory }}
	cpu: {{ .resources.requests.cpu }}
limits:
	memory: {{ .resources.limits.memory }}
	cpu: {{ .resources.limits.cpu }}
{{- end }}


{{/*
Definir as portas dos containers
*/}}
{{- define "app.ports" -}}
{{- range .ports }}
- containerPort: {{ .port }}
{{- end }}
{{- end }}

{{/*
Definindo o nosso configmap de database
*/}}
{{- define "databases.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-database
data:
  config.yaml: |
    {{- toYaml .config | nindent 4 }}
{{- end }}


{{/*
Definindo o nosso configmap de observability
*/}}
{{- define "observability.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .component }}-observability
data:
  config.json: |
    {{ toJson .config }}
{{- end }}
