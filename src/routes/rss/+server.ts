import fs from 'fs';
import path from 'path';
import fm from 'front-matter';
import type { Opus } from '$lib/types';

export async function GET() {
    const baseUrl = 'https://virian.org';
    const postsDir = path.join(process.cwd(), 'src', 'lib', 'opus');

    const posts = fs.readdirSync(postsDir)
        .map((file) => {
            const post = fm<Opus>(fs.readFileSync(path.join(postsDir, file), 'utf-8'));
            return {
                slug: post.attributes.slug,
                title: post.attributes.title,
                author: post.attributes.author,
                description: post.attributes.description,
                date: post.attributes.date,
                type: post.attributes.category,
                published: post.attributes.published,
                content: post.body,
                image: post.attributes.image // Assuming you have an image attribute in your front matter
            };
        })
        .filter((post) => post.published)
        .sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());

    const rssItems = posts.map((post) => {
        const postUrl = `${baseUrl}/${post.type}/${post.slug}`;
        let enclosure = '';
        if (post.image) {
            const imageUrl = `${baseUrl}${post.image}`;
            enclosure = `<enclosure url="${imageUrl}" length="0" type="image/jpeg"/>`;
        }
        return `
        <item>
            <title><![CDATA[${post.title}]]></title>
            <description><![CDATA[${post.description}]]></description>
            <link>${postUrl}</link>
            <guid isPermaLink="true">${postUrl}</guid>
            <dc:creator><![CDATA[${post.author}]]></dc:creator>
            <pubDate>${new Date(post.date).toUTCString()}</pubDate>
            <category>${post.type}</category>
            ${enclosure}
            <content:encoded type="text/markdown"><![CDATA[${post.content}]]></content:encoded>
        </item>
        `;
    }).join('\n');

    const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
    <channel>
        <title><![CDATA[Virian.org]]></title>
        <description><![CDATA[Recent posts from Virian.org]]></description>
        <link>${baseUrl}</link>
        <image>
            <url>${baseUrl}/logo.png</url>
            <title>Virian.org</title>
            <link>${baseUrl}</link>
        </image>
        <generator>Custom RSS Generator</generator>
        <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
        <atom:link href="${baseUrl}/rss.xml" rel="self" type="application/rss+xml"/>
        <language><![CDATA[en]]></language>
        ${rssItems}
    </channel>
</rss>`.trim();

    return new Response(rss, {
        headers: {
            'Content-Type': 'application/xml',
        },
    });
}