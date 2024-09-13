import { getCollection } from "astro:content";
import rss from '@astrojs/rss';
import MarkdownIt from 'markdown-it';
import sanitizeHtml from 'sanitize-html';

const parser = new MarkdownIt();

export async function GET(context) {
  const docs = await getCollection('docs');
  return rss({
    title: "DGov Site Reliability Engineering",
    description: "DGov Site Reliability Engineering",
    site: context.site,
    items: await Promise.all(docs.map(async (post) => {
      const { Content } = await post.render();
      const content = sanitizeHtml(parser.render(post.body));
      return {
        title: post.data.title,
        pubDate: post.data.pubDate || new Date(),
        description: post.data.description,
        link: post.slug === 'index' ? '/' : `/${post.slug}/`,
        content: content,
      };
    })),
  });
}