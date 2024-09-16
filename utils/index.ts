import * as fs from 'node:fs'
import * as path from 'node:path'

const readme = path.resolve('../README.md')

type Directories = string[]

function getDirectories<T extends string | fs.PathLike>(directory: T): Directories {
  const directories: string[] = []
  const files = fs.readdirSync(directory)

  files.forEach((file) => {
    const _path = path.join(directory as string, file)
    if (fs.statSync(_path).isDirectory() && !['node_modules', '.git', 'ios'].includes(file)) {
      const readmePath = path.join(_path, 'README.md')
      if (fs.existsSync(readmePath)) {
        directories.push(file)
      }
      directories.push(...getDirectories(_path))
    }
  })

  return directories
}

function addReadmes(): void {
  let contentMain = fs.readFileSync(readme, 'utf8')
  const readmeDirs = getDirectories('..')

  readmeDirs.forEach((dirName) => {
    const link = `\n* [${dirName}](${dirName}/README.md)\n`
    if (!contentMain.includes(link)) {
      contentMain += link
    }
  })
  fs.writeFileSync(readme, contentMain, 'utf8')
}

// TODO
addReadmes()
