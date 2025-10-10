package hexlet.code.controller;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.Objects;

import hexlet.code.dto.urls.UrlPage;
import hexlet.code.dto.urls.UrlsPage;
import hexlet.code.model.Url;
import hexlet.code.repository.UrlRepository;
import hexlet.code.util.NamedRoutes;
import io.javalin.http.Context;
import io.javalin.http.NotFoundResponse;
import io.javalin.validation.ValidationException;

import static io.javalin.rendering.template.TemplateUtil.model;


public class UrlsController {
    public static void create(Context ctx) {
        try {
            var urlRaw = ctx.formParamAsClass("url", String.class)
                    .check(Objects::nonNull, "Пустое значение")
                    .get();
            var url = new URI(urlRaw).toURL();
            var result = url.getProtocol() + "://" + url.getAuthority();
            if (UrlRepository.findByName(result).isEmpty()) {
                var urlModel = new Url(result);
                UrlRepository.save(urlModel);
                ctx.sessionAttribute("flash", "Страница успешно добавлена");
                ctx.redirect(NamedRoutes.urlsPath());
            } else {
                ctx.sessionAttribute("flash", "Страница уже существует");
                ctx.redirect(NamedRoutes.urlsPath());
            }
        } catch (MalformedURLException | URISyntaxException | IllegalArgumentException | ValidationException e) {
            ctx.sessionAttribute("flash", "Некорректный URL");
            ctx.redirect(NamedRoutes.rootPath());
        } catch (SQLException e) {
            ctx.json(e.getMessage()).status(503);
        }
    }

    public static void index(Context ctx) {
        try {
            var urls = UrlRepository.getEntities();
            var page = new UrlsPage(urls);
            page.setFlash(ctx.consumeSessionAttribute("flash"));
            ctx.render("index.jte", model("page", page));
        } catch (SQLException e) {
            ctx.json(e.getMessage()).status(503);
        }
    }

    public static void show(Context ctx) {
        try {
            var id = ctx.pathParamAsClass("id", Long.class).get();
            var url = UrlRepository.findById(id)
                    .orElseThrow(() -> new NotFoundResponse("Url with id = " + id + " not found"));
            var page = new UrlPage(url);
            ctx.render("show.jte", model("page", page));
        } catch (SQLException e) {
            ctx.json(e.getMessage()).status(503);
        }
    }
}
