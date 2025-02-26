<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
  <?php
  $cssFiles = glob($_SERVER['DOCUMENT_ROOT'] . '/common/styles/*.css');
  foreach ($cssFiles as $cssFile) {
    $cssFilePath = str_replace($_SERVER['DOCUMENT_ROOT'], '', $cssFile);
    echo '<link rel="stylesheet" href="' . $cssFilePath . '">' . PHP_EOL;
  }
  ?>
  <title>Home – Lytham Chess Club</title>
</head>
