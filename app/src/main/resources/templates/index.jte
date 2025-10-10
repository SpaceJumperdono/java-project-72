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
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="${NamedRoutes.rootPath()}">Анализатор страниц</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${NamedRoutes.rootPath()}">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${NamedRoutes.urlsPath()}">Сайты</a>
            </li>
        </ul>
    </div>
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