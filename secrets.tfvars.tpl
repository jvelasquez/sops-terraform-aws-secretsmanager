{{ $secrets := (datasource "secrets").secrets -}}
{{ range $e := $secrets -}}
{{ range $s := $e.secrets -}}
{{ $e.environment }}_{{ $s.name }} = "{{ $s.value }}"
{{ end -}}
{{ end -}}
