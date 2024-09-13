import { getCollection } from "astro:content";
import rss from '@astrojs/rss';

export async function GET(context) {
  const docs = await getCollection('docs');
  return rss({
    title: "DGov Site Reliability Engineering",
    description: "DGov Site Reliability Engineering",
    site: context.site,
    items: docs.map((post) => ({
      title: post.data.title,
      pubDate: post.data.pubDate,
      description: post.data.description,
      link: `/${post.slug}/`,
    })),
  });
}