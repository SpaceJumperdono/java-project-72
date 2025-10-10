@import hexlet.code.util.NamedRoutes
@import hexlet.code.dto.urls.UrlPage
@param UrlPage page

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Сайты</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav>
    <ul>
        <li><a href="${NamedRoutes.rootPath()}">Анализатор страниц</a></li>
        <li><a href="${NamedRoutes.rootPath()}">Главная</a></li>
        <li><a href="${NamedRoutes.urlsPath()}">Сайты</a></li>
    </ul>
</nav>
<h1 style="text-align: left;">Сайт: ${page.getUrl().getName()}</h1>
<table>
    <tr>
        <th>ID</th>
        <td>${page.getUrl().getId()}</td>
    </tr>
    <tr>
        <th>Имя</th>
        <td>${page.getUrl().getName()}</td>
    </tr>
    <tr>
        <th>Дата создания</th>
        <td>${page.getUrl().getTimestamp().toString()}</td>
    </tr>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>