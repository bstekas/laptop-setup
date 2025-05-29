# Windows Specific Instructions

## Docker

Docker is generally optional for Python development, but useful if you develop web apps for cloud deployment.

Installing Docker on Windows was a little tricky because there are extra configurations you need to do to enable Linux virtualization. 

Before installing Docker Desktop, follow instructions for setting up your [system requirements](https://docs.docker.com/desktop/install/windows-install/). Full instructions for enabling and troubleshooting virtualization features can be found [here](https://docs.docker.com/desktop/troubleshoot/topics/#virtualization). A short summary:
- Enabling Windows Subsystem for Linux (WSL): [instructions](https://learn.microsoft.com/en-us/windows/wsl/install)
- Enabling Virtualization in the BIOS: This is machine-specific and you should look up instructions for you motherboard. [It is an "Advanced" CPU configuration.](https://www.virtualmetric.com/blog/how-to-enable-hardware-virtualization)
    - Example: [ASUS instructions](https://www.asus.com/us/support/faq/1045141/)
- Ensure these features are turned on. 
    - "Turn Windows features on or off" can be found in `Control Panel\Programs\Programs and Features`:
    ![control-panel](./assets/windows-features.png)

Once this is done, download Docker Desktop from [here](https://www.docker.com/products/docker-desktop/) and install.

When you're all done you should see this welcoming penguin :linux: in the sidebar of File Explorer:

![sidebar](./assets/linux-sidebar.png)
