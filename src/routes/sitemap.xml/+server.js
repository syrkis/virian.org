export async function GET() {
    const baseUrl = 'https://virian.org'; // Base URL of your website

    const codePosts = [
        {
            slug: 'deep-cultural-inference',
            lastmod: '2023-06-15', // Add the last modified date of the code post
        },
        {
            slug: 'multimodal-brain-encoding',
            lastmod: '2023-06-15', // Add the last modified date of the code post
        },
        {
            slug: 'recurrent-authorship-change-detection',
            lastmod: '2023-06-15', // Add the last modified date of the code post
        },
        // Add more code post objects as needed
    ];

    const textPosts = [
        {
            slug: 'a-reflection-on-cypernetics',
            lastmod: '2023-06-15', // Add the last modified date of the text post
        },
        {
            slug: 'numerical-representations-of-meaning',
            lastmod: '2023-06-15', // Add the last modified date of the text post
        },
        {
            slug: 'pricing-carbon-removal',
            lastmod: '2023-06-15', // Add the last modified date of the text post
        },
        // Add more text post objects as needed
    ];
    const codePostUrls = codePosts.map((post) => {
        const url = new URL(`${baseUrl}/code/${post.slug}`);
        url.searchParams.set('lastmod', post.lastmod);
        return `
            <url>
                <loc>${url.href}</loc>
                <lastmod>${post.lastmod}</lastmod>
                <changefreq>weekly</changefreq>
                <priority>0.7</priority>
            </url>
        `;
    });

    const textPostUrls = textPosts.map((post) => {
        const url = new URL(`${baseUrl}/text/${post.slug}`);
        url.searchParams.set('lastmod', post.lastmod);
        return `
            <url>
                <loc>${url.href}</loc>
                <lastmod>${post.lastmod}</lastmod>
                <changefreq>weekly</changefreq>
                <priority>0.7</priority>
            </url>
        `;
    });

    const sitemap = `
        <?xml version="1.0" encoding="UTF-8" ?>
        <urlset
            xmlns="https://www.sitemaps.org/schemas/sitemap/0.9"
            xmlns:xhtml="https://www.w3.org/1999/xhtml"
            xmlns:mobile="https://www.google.com/schemas/sitemap-mobile/1.0"
            xmlns:news="https://www.google.com/schemas/sitemap-news/0.9"
            xmlns:image="https://www.google.com/schemas/sitemap-image/1.1"
            xmlns:video="https://www.google.com/schemas/sitemap-video/1.1"
        >
            <url>
                <loc>${baseUrl}/</loc>
                <changefreq>weekly</changefreq>
                <priority>0.7</priority>
            </url>
            <url>
                <loc>${baseUrl}/code</loc>
                <changefreq>weekly</changefreq>
                <priority>0.7</priority>
            </url>
            ${codePostUrls.join('\n')}
            <url>
                <loc>${baseUrl}/text</loc>
                <changefreq>weekly</changefreq>
                <priority>0.7</priority>
            </url>
            ${textPostUrls.join('\n')}
            <url>
                <loc>${baseUrl}/ex-libris</loc>
                <changefreq>weekly</changefreq>
                <priority>0.7</priority>
            </url>
        </urlset>`.trim();

    return new Response(sitemap, {
        headers: {
            'Content-Type': 'application/xml',
        },
    });
}
