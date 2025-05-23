# Macro Asset Library

Macro is designed to be a flexible and modular model that can adapt to various energy system representations. The model includes a library of assets that represent different technologies within the energy system.

Each asset is defined by a **combination of transformations, edges, and storage units** that represent the physical and operational characteristics of a technology. These assets can be combined to create a detailed representation of the energy system, capturing the interactions between technologies and sectors.
For instace, a **natural gas power plant** asset consists of a technology that converts natural gas into electricity while producing CO2 emissions. This asset includes:

- A **transformation vertex** representing the conversion process: `Natural Gas -> Electricity + CO2`,
- An incoming **edge** for natural gas supply,
- An outgoing **edge** for electricity production, and
- A second outgoing edge for **CO2 emissions**.

All other assets in the library follow a similar structure, with specific transformations, edges, and storage units based on their respective technologies.

## Asset Library
The current library includes the following assets:

- **Battery**

```@raw html
<img src="assets/battery.png" alt="drawing" width="150"/>
```

- **Electrolyzer**
- **Fuel Cell**
- **Hydrogen Storage**
- **Power Line**
- **Thermal Hydrogen Plant**
- **Thermal Power Plant**

```@raw html
<img src="assets/natgas.png" alt="drawing" width="220"/>
```

- **Variable Renewable Energy resources (VRE)**
```@raw html
<img src="assets/solar_pv.png" alt="drawing" width="180"/>
```