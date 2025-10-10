@import hexlet.code.dto.urls.UrlsPage
@import hexlet.code.util.NamedRoutes
@param UrlsPage page

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
@if(page != null && page.getFlash() != null)
    @if(page.getFlash().equals("Страница уже существует"))
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            ${page.getFlash()}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif
    @if(page.getFlash().equals("Страница успешно добавлена"))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${page.getFlash()}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif
@endif
<h1 style="text-align: center;">Сайты</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Имя</th>
        <th>Последняя проверка</th>
        <th>Код ответа</th>
    </tr>
    </thead>
    <tbody>
        @for(var url : page.getUrls())
        <tr>
            <td>${url.getId()}</td>
            <td>
                <a href="${NamedRoutes.urlPath(url.getId())}">${url.getName()}</a>
            </td>
        </tr>
        @endfor
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>