import * as fs from 'fs';
import * as path from 'path';
import manifest from './manifest.json';
import archiver = require('archiver');

const version = manifest.version_number;
const zipFileName = `GAFF-RD2L-${version}.zip`;
const outputPath = path.join(__dirname, zipFileName);
const output = fs.createWriteStream(outputPath);
const archive = archiver('zip', {
    zlib: { level: 9 }
});

output.on('close', () => {
    console.log(`${zipFileName} has been created, ${archive.pointer()} total bytes.`);
});

archive.on('error', (err: Error) => {
    throw err;
});

archive.pipe(output);

// Add the .import files starting with 'rd2l'
const importDir = path.resolve(__dirname, '..', '..', '.import');
if (fs.existsSync(importDir)) {
    const files = fs.readdirSync(importDir).filter(file => file.startsWith('rd2l'));
    files.forEach(file => {
        archive.file(path.join(importDir, file), { name: `.import/${file}` });
    });
}

// Add the necessary files and folders under mods-unpacked/GAFF-RD2L
const includedPaths = [
    'content',
    'content_data',
    'extensions',
    'translations',
    'LICENSE',
    'manifest.json',
    'mod_main.gd'
];

includedPaths.forEach(item => {
    const itemPath = path.join(__dirname, item);
    if (fs.existsSync(itemPath)) {
        if (fs.lstatSync(itemPath).isDirectory()) {
            archive.directory(itemPath, `mods-unpacked/GAFF-RD2L/${item}`);
        } else {
            archive.file(itemPath, { name: `mods-unpacked/GAFF-RD2L/${item}` });
        }
    }
});

void archive.finalize();
