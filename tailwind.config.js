module.exports = {
    content: [
        "./src/**/*.{js,scss,ts,css,vue}",
        "./templates/**/*.{twig,html}"
    ],
    theme: {
        fontFamily: {
            'sans': ['Inter', 'sans-serif'],
        },
        borderRadius: {
            'none': '0',
            'mobile': 'var(--border-radius-mobile)',
            'tablet': 'var(--border-radius-tablet)',
            'base': 'var(--border-radius)',
            'full': '9999px',
        },
        extend: {
            gap: {
                'mobile': 'var(--gutter-mobile)',
                'tablet': 'var(--gutter-tablet)',
                'base': 'var(--gutter)',
            },
            colors: {
                primary: 'var(--primary)',
                secondary: 'var(--secondary)',
                'secondary-medium': 'var(--secondary-medium)',
                'secondary-light': 'var(--secondary-light)',
                'secondary-lighter': 'var(--secondary-lighter)',
            },
        },
        fontSize: {
            'sm': 'var(--fontSmall)',
            'base': 'var(--fontBase)',
            'lg': 'var(--fontLarge)',
        },
    },
    variants: {},
    plugins: [
        require('@mertasan/tailwindcss-variables')
    ]
}