$env:PATH = "C:\Program Files\nodejs;$env:APPDATA\npm;" + $env:PATH
$baseUrl = "https://facultad.indoamericatech.com"
$outputDir = "c:\Users\LENOVO\Documents\TESIS\EVIDENCIAS_PORTAL_ORIGINAL"

$pages = @(
    @{ Name = "01_inicio_home.png"; Path = "/" },
    @{ Name = "02_carreras_general.png"; Path = "/carreras" },
    @{ Name = "03_carrera_ingenieria_ti.png"; Path = "/carreras/ingenieria-ti" },
    @{ Name = "04_carrera_ingenieria_industrial.png"; Path = "/carreras/ingenieria-industrial" },
    @{ Name = "05_carrera_ingenieria_electrica.png"; Path = "/carreras/ingenieria-electrica" },
    @{ Name = "06_tramites_general.png"; Path = "/tramites" },
    @{ Name = "07_tramite_matriculas.png"; Path = "/tramites/matriculas" },
    @{ Name = "08_tramite_titulacion.png"; Path = "/tramites/titulacion" },
    @{ Name = "09_tramite_practicas.png"; Path = "/tramites/practicas" },
    @{ Name = "10_tramite_vinculacion.png"; Path = "/tramites/vinculacion" },
    @{ Name = "11_tramite_justificacion_faltas.png"; Path = "/tramites/justificacion-faltas" },
    @{ Name = "12_tramite_horarios.png"; Path = "/tramites/horarios" },
    @{ Name = "13_faq_preguntas_frecuentes.png"; Path = "/faq" }
)

foreach ($page in $pages) {
    $targetUrl = "$baseUrl$($page.Path)"
    $destFile = Join-Path $outputDir $page.Name
    Write-Host "Capturando $($page.Name) desde $targetUrl..."
    npx playwright screenshot --channel=chrome --full-page --wait-for-timeout=2000 "$targetUrl" "$destFile"
}

Write-Host "Todas las capturas se completaron con éxito en $outputDir."

