# MobileHMS – Mobile Access App for Shelter Data
Discovery is the mobile-friendly version of the Room In The Inn system, built with Ignition Perspective.
It is designed for quick, read-only access to key shelter information directly from a phone or tablet — no authentication required.

This application is ideal for outreach workers, partner agencies, and volunteers who need fast access to real-time data in the field.

## Purpose
The MobileHMS app allows users to easily view data stored in the system without logging in. It includes several public-facing views:

* Participants – View a list of registered participants and their key details

* Winter Shelters – Browse available winter shelters, capacity, and availability

* Providers – Access provider contact information, addresses, and services

-Note: This is a read-only portal. No changes or edits can be made through this interface.-

## Requirements
`Ignition 8.1.47` or later

SQL Server database populated with `Discovery_Schema.sql` and `Discovery_Master_Data.sql`

`Global` project must be present and configured before this one

## Project Structure
[Documentation](https://github.com/OpenHMSHub/Documentation/wiki/MobileHMS)

[ERD](https://github.com/OpenHMSHub/Documentation/wiki/Entity-Relationship-Diagrams)

## Installation
[Instalation Guide](https://github.com/OpenHMSHub/Documentation/wiki/Instalation-Guide)

Clone the repository into your Ignition projects directory:

Linux:
`/usr/local/bin/ignition/data/projects`

Windows:
`C:\Program Files\Inductive Automation\Ignition\data\projects`

```bash
git clone https://github.com/OpenHMSHub/MobileHMS.git
```
Restart your Ignition Gateway.

Ensure that the Global project is correctly inherited by the MobileHMS project:
Navigate to `Config` → `System` → `Projects` in the Gateway and confirm Global is listed as a parent project.

Open the mobile-access portal in your browser or phone:
`http://localhost:8088/data/perspective/client/MobileHMS/`

## Related Projects
[Global](https://github.com/OpenHMSHub/Global)

[HMS](https://github.com/OpenHMSHub/HMS)

[WinterShelterPortal](https://github.com/OpenHMSHub/WinterShelterPortal)
