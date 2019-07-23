{{ $secrets := (datasource "secrets").secrets -}}
{{ range $e := $secrets -}}
# ---------------------------------------------------------------------------------------------------------------------
# {{ $e.environment }} secrets
# ---------------------------------------------------------------------------------------------------------------------
{{ range $s := $e.secrets -}}
variable "{{ $e.environment }}_{{ $s.name }}" {
  description = "{{ $s.description }}"
}
resource "aws_secretsmanager_secret" "{{ $e.environment }}_{{ $s.name }}" {
  name                    = "{{ $e.environment }}/{{ $s.name }}"
  description             = "{{ $s.description }}"
  recovery_window_in_days = 7
}
resource "aws_secretsmanager_secret_version" "{{ $e.environment }}_{{ $s.name }}" {
  secret_id     = "${aws_secretsmanager_secret.{{ $e.environment }}_{{ $s.name }}.id}"
  secret_string = "${var.{{ $e.environment }}_{{ $s.name }}}"
}
{{ end -}}
{{ end -}}
