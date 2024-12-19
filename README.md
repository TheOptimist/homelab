# Homelab
Some (very specific) definitions of containers to run on the QNAP TVS-EC880 (bignas), along with software configuration to make it easier (and nicer) when working remotely on the system.

## Prerequisites
Mostly notes to myself on what to create if I ever have to go through this process again.

 - [ ] Storage pool in RAID 0 across two NVME drives
   - [ ] Single thick volume 'system'
   - [ ] Single shared folder 'containers'
     - [ ] media     - {sabnzbd,radarr,sonarr,prowlarr,recyclarr,bazarr,jellyfin,jellyseerr}
     - [ ] overwatch - {homepage,changedetection}
 - [ ] Storage pool in RAID 5 across all hard drives
   - [ ] Thin volume 'media'
     - [ ] Shared folder 'media'
       - [ ] downloads
         - [ ] incomplete
         - [ ] complete
           - [ ] {movies,shows,songs,books,comics}
       - [ ] content
         - [ ] {movies,shows,songs,books,comics}
   - [ ] Thin volume 'cloud'
 - [ ] [MyQNAP](https://www.myqnap.org) repository installed [<small>`https://www.myqnap.org/repo.xml`</small>]
 - [ ] <small>`homelab`</small> group (id 1000)
 - [ ] <small>`homelab`</small> user (id 1000) with SSH access
   - [ ] <small>`starship`</small> installed
   - [ ] <small>`eza`</small> installed

## Deploying
Use `rsync` to synchronize the contents of the `home` folder to the NAS. Placing everything in the actual `home` directory on the target machine prevents the use of `--delete`, which might become a problem (or annoying enough for me to fix).

```bash
rsync \
  # Copy files over using remote shell 'ssh'
  --rsh ssh \
  # All files in all directories
  --recursive \
  # Directory to copy (putting a `/*` meant rsync ignored `.files`)
  ./homelab
  # Copy over the actual homelab folder on the NAS (hence no --delete)
  homelab@bignas.sh:/share/homes
```

At some point it might be interesting to automate the deployment workflow more, but I suspect a "container update" watcher workflow would be better.