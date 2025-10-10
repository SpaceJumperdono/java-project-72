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
    <link href="/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <nav class="main-nav">
        <ul>
            <li><a href="${NamedRoutes.rootPath()}">Анализатор страниц</a></li>
            <li><a href="${NamedRoutes.rootPath()}">Главная</a></li>
            <li><a href="${NamedRoutes.urlsPath()}">Сайты</a></li>
        </ul>
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