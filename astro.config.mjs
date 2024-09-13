// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	site: "https://sre.radk8s.net",
	integrations: [
		starlight({
			title: 'DGov Site Reliability Engineering',
			lastUpdated: true,
			social: {
				github: 'https://github.com/wagov-dtt/sre.radk8s.net',
				rss: 'https://sre.radk8s.net/rss.xml'
			},
			editLink: {
				baseUrl: 'https://github.com/wagov-dtt/sre.radk8s.net/edit/main',
			},
		}),
	],
});
