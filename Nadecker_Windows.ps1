docker pull willysunny/nadecker:latest
docker stop nadeko
docker cp nadeko:/root/nadeko/credentials.json credentials.json
docker cp nadeko:/opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data/NadekoBot.db NadekoBot.db
docker rm nadeko
docker create --name=nadeko -v /nadeko/conf:/root/nadeko -v /nadeko/data/:/opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data willysunny/nadecker:latest
docker cp credentials.json nadeko:/root/nadeko
docker cp NadekoBot.db nadeko:/opt/NadekoBot/src/NadekoBot/bin/Release/netcoreapp2.0/data/NadekoBot.db
docker start -a nadeko