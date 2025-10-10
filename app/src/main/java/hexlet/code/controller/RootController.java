package hexlet.code.controller;

import hexlet.code.dto.BasePage;
import io.javalin.http.Context;

import static io.javalin.rendering.template.TemplateUtil.model;

public class RootController {
    public static void build(Context ctx) {
        var page = new BasePage(ctx.consumeSessionAttribute("flash"));
        ctx.render("build.jte", model("page", page));
    }
}
