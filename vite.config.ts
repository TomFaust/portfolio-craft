import {defineConfig} from "vite";
import restart from 'vite-plugin-restart';
import dotenv from 'dotenv';
import path from "path";
import vue from "@vitejs/plugin-vue";
import {glob} from "glob";

dotenv.config();

export default defineConfig(({command}) => {
    let files = {};

    if (command === 'build') {
        const js = glob.sync('./src/js/*.js').reduce((acc, path) => {
            let entry = path.replace('.js', '')
            entry = entry.replace('./src/js/', '')
            acc[entry] = path
            return acc
        }, {});

        const ts = glob.sync('./src/js/*.ts').reduce((acc, path) => {
            let entry = path.replace('.ts', '')
            entry = entry.replace('./src/js/', '')
            acc[entry] = path
            return acc
        }, {});

        files = {...js, ...ts};
    }

    return {
        base: command === 'serve' ? '' : '/dist/',
        build: {
            manifest: true,
            outDir: './web/dist/',
            rollupOptions: {
                input: files,
            }
        },
        server: {
            fs: {
                strict: false,
            },
            origin: `${process.env.PRIMARY_SITE_URL}:3000`,
            host: '0.0.0.0',
            port: 3000,
            strictPort: true,
            hmr: true,
        },
        resolve: {
            alias: {
                '@': path.join(__dirname, 'src/')
            }
        },
        plugins: [
            restart({
                reload: [
                    './templates/**/*'
                ]
            }),
            vue()
        ]
    }
});