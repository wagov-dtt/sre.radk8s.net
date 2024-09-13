import { defineCollection, z } from 'astro:content';
import { docsSchema } from '@astrojs/starlight/schema';
import { rssSchema } from '@astrojs/rss';

export const collections = {
  docs: defineCollection({ schema: docsSchema({extend: rssSchema}) }),
};