Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$form = New-Object System.Windows.Forms.Form
$form.Text = "maressilva tech."
$form.Size = New-Object System.Drawing.Size(450, 370)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.ControlBox = $false
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::FromArgb(26, 15, 8)

$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "accountability check-in"
$titleLabel.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(244, 232, 216)
$titleLabel.AutoSize = $true
$titleLabel.Location = New-Object System.Drawing.Point(30, 30)
$form.Controls.Add($titleLabel)

$questionsLabel = New-Object System.Windows.Forms.Label
$questionsLabel.Text = "have you:`n`n- sent an email to a lead?`n`n- updated your pipeline?`n`n- made progress on goals?"
$questionsLabel.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Regular)
$questionsLabel.ForeColor = [System.Drawing.Color]::FromArgb(244, 232, 216)
$questionsLabel.AutoSize = $true
$questionsLabel.Location = New-Object System.Drawing.Point(30, 75)
$form.Controls.Add($questionsLabel)

$actionLabel = New-Object System.Windows.Forms.Label
$actionLabel.Text = "time to take action."
$actionLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Italic)
$actionLabel.ForeColor = [System.Drawing.Color]::FromArgb(200, 180, 160)
$actionLabel.AutoSize = $true
$actionLabel.Location = New-Object System.Drawing.Point(30, 230)
$form.Controls.Add($actionLabel)

$yesButton = New-Object System.Windows.Forms.Button
$yesButton.Text = "yes, made progress"
$yesButton.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$yesButton.Size = New-Object System.Drawing.Size(160, 35)
$yesButton.Location = New-Object System.Drawing.Point(30, 265)
$yesButton.BackColor = [System.Drawing.Color]::FromArgb(244, 232, 216)
$yesButton.ForeColor = [System.Drawing.Color]::FromArgb(26, 15, 8)
$yesButton.FlatStyle = "Flat"
$yesButton.FlatAppearance.BorderSize = 0
$yesButton.DialogResult = [System.Windows.Forms.DialogResult]::Yes
$form.Controls.Add($yesButton)

$noButton = New-Object System.Windows.Forms.Button
$noButton.Text = "no, show to-do"
$noButton.Font = New-Object System.Drawing.Font("Segoe UI", 10)
$noButton.Size = New-Object System.Drawing.Size(160, 35)
$noButton.Location = New-Object System.Drawing.Point(205, 265)
$noButton.BackColor = [System.Drawing.Color]::FromArgb(60, 40, 30)
$noButton.ForeColor = [System.Drawing.Color]::FromArgb(244, 232, 216)
$noButton.FlatStyle = "Flat"
$noButton.FlatAppearance.BorderSize = 0
$noButton.DialogResult = [System.Windows.Forms.DialogResult]::No
$form.Controls.Add($noButton)

$form.AcceptButton = $yesButton

# Shake animation for visibility
$form.Add_Shown({
    $originalLocation = $form.Location
    for ($i = 0; $i -lt 3; $i++) {
        $form.Location = New-Object System.Drawing.Point(($originalLocation.X - 10), $originalLocation.Y)
        Start-Sleep -Milliseconds 50
        $form.Location = New-Object System.Drawing.Point(($originalLocation.X + 10), $originalLocation.Y)
        Start-Sleep -Milliseconds 50
    }
    $form.Location = $originalLocation
})

$result = $form.ShowDialog()

# If user clicked "No", open REMINDERS.md
if ($result -eq [System.Windows.Forms.DialogResult]::No) {
    Start-Process "code" -ArgumentList "c:\Users\gtoza\Documents\maressilva_website\REMINDERS.md"
}
