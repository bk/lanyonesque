# Lanyonesque

Lanyonesque is a theme for the static site generator [wmk][wmk]. It
is a port of the popular Jekyll theme [Lanyon][lanyon]. The appearance is
almost the same, so for an impression of how it looks, you can take a look at
the [Lanyon demo site][demo].

[wmk]: https://github.com/bk/wmk.git
[lanyon]: http://lanyon.getpoole.com
[demo]: https://lanyon.getpoole.com/

## Setup

In your `wmk` project put the `lanyonesque` theme inside the `themes`
subdirectory, e.g. by cloning this repository under that name or adding it as a
submodule.  Then add the setting `theme: lanyonesque` to your
`wmk_config.yaml`.

For a quick demo, you can then copy the files in the `content` subdirectory
into your own project and run `wmk build`.

Lanyonesque expects quite a few settings and context variables to be present.
Here is a sample `wmk_config.yaml` file demonstrating them:

```yaml
default_template: base/default.mhtml
pre_render: true
markdown_extensions: ['extra', 'sane_lists', 'codehilite']
theme: lanyonesque
template_context:
    site_title: Lanyonesque
    site_base_url: https://wmk-example.net
    site_tagline: A port of the Jekyll Lanyon theme
    site_lang: en
    site_description: |
        This is an example site illustrating Lanyonesque,
        which is a port of the Jekyll theme Lanyon to wmk.
    site_paginate: 4
    site_author: Dr. Hastie Lanyon
    site_author_email: hl@wmk-example.net
    site_body_css_class: layout-reverse
```

All of the context variables used by the theme have names starting with `site`.
Some of them are required; others are optional but recommended.

It is not necessary to add `codehilite` to `markdown_exensions` unless you
intend to use fenced code blocks in your markdown content.

The `pre_render` setting is necessary unless you intend to change the
default frontpage, which shows a list of blog entries (including the
entry body).

### Theme appearance

Lanyonesque supports some modifications to the appearance and
functionality of the theme through the context variable
`site_body_css_class` as seen above. This sets the `<body>` class(es) in the
default base template.

The following css classes are supported in the value of `site_body_css_class`.

- Colour theme: `theme-base-08` (red), `theme-base-09` (orange),
  `theme-base-0a` (yellow), `theme-base-0b` (green), `theme-base-0c` (teal),
  `theme-base-0d` (blue), theme-base-0e (violet), or `theme-base-0f` (brown).
  New themes can be created by adding a few lines of CSS - see
  `assets/scss/_themes.scss` for details.
- `layout-reverse` moves the sidebar (and menu button) to the right instead of
  the default left.
- `sidebar-overlay` makes the sidebar go on top of the content instead of
  pushing it to the side, which is the default.

All of these settings are inherited from Lanyon.

## File organization

By default, Lanyonesque is a blog-oriented theme. If you wish to change this,
you need to override the frontpage (`index.mhtml`) and probably also the
`sidebar` def of the default base template, `base/default.mhtml`.

Blog entries go into `content/posts'. They should specify `title`, `pubdate` (a
date in ISO format) and `template` in their frontmatter. Normally the value of
`template` should be `base/post.mhtml`. Blog entries are displayed on the
frontpage. The value of `site_paginate` determines how many entries are
displayed at a time (they are paginated and a pagination widget is shown at
the bottom of the page).

If most of your content consists of blog entries, it may be convenient to
change the `default_template` value in `wmk_config.yaml` to `base/post.mhtml`,
in which case the `template` setting in the blog entry frontmatter can be
omitted.

Other files in `content` are regarded as "pages" and go into the navigation in
the sidebar. A page does not need to specify a `pubdate` and should normally
have a `template` value of `base/page.mhtml`.

## Standalone templates

Lanyonesque provides three standalone templates:

- The frontpage, `index.mhtml` - see above.
- An Atom feed listing blog entries, `atom.xml.mhtml`.
- A 404 page, `404.mhtml`. (Note that the produced `/404.html` page will not
  be actually used unless your webserver is configured appropriately.)


## Authors

- For Lanyonesque: **Baldur Kristinsson** <https://github.com/bk>.
- For Lanyon: **Mark Otto** <https://github.com/mdo>.

## License

[MIT license](LICENSE.md).
