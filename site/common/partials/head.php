<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
  <?php
  $cssFiles = glob($_SERVER['DOCUMENT_ROOT'] . '/common/styles/*.css');
  foreach ($cssFiles as $cssFile) {
    $cssFilePath = str_replace($_SERVER['DOCUMENT_ROOT'], '', $cssFile);
    echo '<link rel="stylesheet" href="' . $cssFilePath . '">' . PHP_EOL;
  }
  ?>
  <title>Home – Lytham Chess Club</title>
</head>
