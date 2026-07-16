import 'dart:html' as html;

void updateMetaTags({required String title, required String description}) {
  html.document.title = title;

  html.document
      .querySelector('meta[name="description"]')
      ?.setAttribute('content', description);

  html.document
      .querySelector('meta[property="og:title"]')
      ?.setAttribute('content', title);

  html.document
      .querySelector('meta[property="og:description"]')
      ?.setAttribute('content', description);
}