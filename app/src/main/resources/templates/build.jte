@import hexlet.code.util.NamedRoutes
@import hexlet.code.dto.BasePage
@param BasePage page = null

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Подключение Bootstrap</title>
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
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${page.getFlash()}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif
    <h1 style="text-align: center;">Анализатор страниц</h1>
    <h6 style="text-align: center;">Бесплатно проверяйте сайты на SEO пригодность</h6>
    <div class="d-flex justify-content-center align-items-center">
        <form action="/urls" method="post">
            <div class="mb-3">
                <label class="form-label">
                    <input type="text" class="form-control" placeholder="ссылка" name="url"/>
                </label>
                <input type="submit" class="btn btn-primary" value="Сохранить"/>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>