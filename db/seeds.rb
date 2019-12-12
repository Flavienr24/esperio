# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'
require 'faker'

puts 'Clean database...'

Project.destroy_all
Company.destroy_all
User.destroy_all
Collaboration.destroy_all

puts 'DB cleaned'

aerospace = Company.create(name: 'Aerospace LTD')

puts 'Company created'


list_of_functions = []
list_of_tags = []
list_descriptions = []
list_project_names = []
list_of_avatars = []
list_of_cities = ["Paris", "Grenoble", "Toulouse", "Marseille"]

puts 'Arrays created'


function_json =[
  {
    "function": "Aerospace Engineering and Operations Reseacher"
  },
  {
    "function": "Architectural and Engineering Reseacher"
  },
  {
    "function": "Computer Hardware Reseacher"
  },
  {
    "function": "Microprocessor Engineering Reseacher"
  },
  {
    "function": "Electrical and Electronics Reseacher"
  },
  {
    "function": "Industrial Reseacher Junior"
  },
  {
    "function": "Materials Expert"
  },
  {
    "function": "Cosmic Physic Reseacher"
  },
  {
    "function": "Calculation Engineering Reseacher"
  },
  {
    "function": "Stress Analyst Expert"
  },
  {
    "function": "Physical Scientist Fellow"
  },
  {
    "function": "Supervisory Interdisciplinary Fellow"
  },
  {
    "function": "Spatial Environment Reseacher"
  },
  {
    "function": "Chief Reseacher Officer Assistant"
  },
  {
    "function": "Aeropace Reseacher"
  },
  {
    "function": "Space Travel Reseacher"
  },
  {
    "function": "Lunar Biologist Reseacher"
  },
  {
    "function": "Mathematician Expert"
  },
  {
    "function": "Mathematical Statistic Fellow"
  },
  {
    "function": "Mechanical Expert"
  },
  {
    "function": "PHD Intern"
  },
  {
    "function": "Aeronautic Design Reseacher"
  },
  {
    "function": "Innovation Manager"
  },
  {
    "function": "Space Security Expert"
  },
  {
    "function": "Appplications Integration Reseacher"
  },
  {
    "function": "Cybersecurity Expert"
  }
]

project_json = [
  {
    "name": "BioSentinel",
    "description": "The BioSentinel mission was selected as one of the secondary payloads, and the sole biological experiment, to fly on the Space Launch System’s first Exploration Mission (EM-1) planned to launch in 2020. The primary objective of BioSentinel is to develop a biosensor to detect and measure the impact of space radiation on living organisms over long durations beyond Low Earth Orbit (LEO)."
  },
  {
    "name": "EcAMSat ",
    "description": "The E. coli AntiMicrobial Satellite (EcAMSat) mission will investigate space microgravity effects on the antibiotic resistance and its genetic basis of E. coli, a bacterial pathogen responsible for urinary tract infection in humans and animals. Bacterial antibiotic resistance may pose a danger to astronauts in microgravity, where the immune response is weakened. Scientists believe that the results of this experiment could help design effective countermeasures to protect astronauts’ health during long-duration human space missions. EcAMSat is being developed through a partnership between NASA’s Ames Research Center and the Stanford University School of Medicine. EcAMSAT is slated for launch in late 2016."
  },
  {
    "name": "PowerCell ",
    "description": "In its first flight, the PowerCell Payload will investigate the performance of microbial mini-ecologies containing both photosynthetic microbes and consumer organisms. Photosynthetic cyanobacteria will produce the carbohydrate sucrose (table sugar), which will feed Bacillus subtilis, a robust bacterium commonly found in soil and the gut."
  },
  {
    "name": "AVA ",
    "description": "Affordable Vehicle Avionics (AVA): Common Modular Avionics System for Nano-Launchers Offering Affordable Access to Space.  NASA Ames Research Center has developed and tested a prototype low-cost avionics package for space launch vehicles that provides complete GNC functionality in a package smaller than a tissue box (100mm x 120mm x 69mm; 4in x 4.7in x 2.7in), with a mass of less than 0.84kg (2lbs)."
  },
  {
    "name": "TechEdSat-5​",
    "description": "In late 2016, TechEdSat-5 will launch from the International Space Station (ISS). This CubeSat will deploy an exo-brake, an exo-atmospheric drag chute that can be used for controlled de-orbit of a small payload canister from Earth orbit. This capability is useful for returning biological samples from ISS and even planetary samples from beyond Earth. TechEdSat-5 will demonstrate improved GPS tracking and a modulated exo-brake allowing more precise control of exo-atmospheric drag, re-entry time and location. It features multiple cameras to help verify exo-brake deployment and modulation. GPS tracking is anticipated to give precise orbital trajectories leading to better drag assessment and re-entry targeting among other benefits."
  },
  {
    "name": "Nodes",
    "description": "NASA’s Nodes satellites, a pair of tissue box-size CubeSats, launched to the International Space Station on December 6, 2015. The two Nodes satellites were deployed from the Station on May 16, 2016 to demonstrate new network capabilities critical to the operation of swarms of spacecraft. Weighing just 4.5 pounds each and measuring 4 inches by 4 inches by 6.5 inches, the Nodes satellites, once deployed, will test new network capabilities for operating swarms of spacecraft in the future."
  },
  {
    "name": "EDSN ",
    "description": "On November 3, 2015, the eight small satellites of the Edison Demonstration of Smallsat Networks (EDSN) mission were lost in the failure of the launch vehicle that was carrying them to orbit as secondary payloads. There will be an opportunity to complete some of the objectives of the EDSN mission in the Nodes follow-on mission."
  },
  {
    "name": "PhoneSat",
    "description": "NASA's PhoneSat project tests whether spacecraft can be built using smartphones to launch the lowest-cost satellites ever flown in space. Each PhoneSat nanosatellite is one cubesat unit - a satellite in a 10 cm (approx. 4 inches) cube or about the size of a tissue box - and weighs approximately three pounds. Engineers believe PhoneSat technology will enable NASA to launch multiple new satellites capable of conducting science and exploration missions at a small fraction of the cost of conventional satellites."
  },
  {
    "name": "Exploration Ground Systems ",
    "description": "Exploration Ground Systems' primary objective is to prepare the center to process and launch the next-generation vehicles and spacecraft designed to achieve NASA's goals for space exploration."
  },
  {
    "name": "HEO-ESD Integration ",
    "description": "Exploration Systems Development Division (ESD) has been charged to oversee the development of nation’s next generation of human exploration systems. ESD Responsibilities include: Provide HEO MD with insight and oversight of programs developing human exploration capabilities (MPCV, SLS, and 21st Century Ground Systems), Complete Constellation Transition during FY11, Manage cross-program integration across MPCV, SLS and 21CGS Programs (Manage interfaces between programs and cross-program risks as well as ensure cross-program integration is occurring). "
  },
  {
    "name": "International Space Station (ISS)",
    "description": "The International Space Station is an unprecedented achievement in global human endeavors to conceive, plan, build, operate, and utilize a research platform in space. With the assembly of the space station at its completion and the support of a full-time crew of six, a new era of utilization for research has begun. "
  },
  {
    "name": "James Webb Space Telescope (JWST) ",
    "description": "The James Webb Space Telescope is a large, infrared-optimized space telescope. Webb will probe for the \"first light\" after the Big Bang and find the first galaxies that formed in the early Universe, connecting the Big Bang to our own Milky Way Galaxy. Webb will peer through dusty clouds to see stars forming planetary systems, connecting the Milky Way to our own Solar System and look for the chemical signatures of extra-terrestrial life."
  },
  {
    "name": "Joint Polar Satellite System-2 (JPSS-2) ",
    "description": "JPSS-2 will provide operational continuity of satellite-based observations and products for NOAA Polar-Orbiting Environmental Satellites (POES) and Suomi NPP satellite and ground systems. The baseline plan for JPSS Ground System will be sustained to support JPSS-2, similar to JPSS-1."
  },
  {
    "name": "Joint Polar Satellite System Ground (JPSS Ground) ",
    "description": "The ground system for the JPSS mission is a global network of receiving stations linked to NOAA, which distributes the satellite data and derived products to users worldwide. The versatile ground system controls the spacecraft, ingests and processes data and provides information to users like NOAA's National."
  },
  {
    "name": "Landsat 9 ",
    "description": "Landsat 9 — a partnership between NASA and the U.S. Geological Survey — will continue the Landsat program’s critical role in monitoring, understanding and managing the land resources needed to sustain human life."
  },
  {
    "name": "Lucy ",
    "description": "Lucy will be the first space mission to study the Trojan asteroids of Jupiter. The mission takes its name from the fossilized human ancestor (called “Lucy” by her discoverers) whose skeleton provided unique insight into humanity's evolution. Likewise, the Lucy mission will revolutionize our knowledge of planetary origins and the formation of the solar system."
  },
  {
    "name": "Mars 2020 ",
    "description": "Designed to advance high-priority science goals for Mars exploration, the mission would address key questions about the potential for life on Mars. The mission would also provide opportunities to gather knowledge and demonstrate technologies that address the challenges of future human expeditions to Mars."
  },
  {
    "name": "Multi-Purpose Crew Vehicle (Orion MPCV) ",
    "description": "This spacecraft will serve as the primary crew vehicle for missions beyond low Earth orbit. The Orion MPCV is capable of conducting regular in-space operations (rendezvous, docking, extravehicular activity) in conjunction with payloads delivered by the Space Launch System."
  },
  {
    "name": "Psyche ",
    "description": "The Psyche mission is a journey to a unique metal asteroid orbiting the Sun between Mars and Jupiter. What makes the asteroid Psyche unique is that it appears to be the exposed nickel-iron core of an early planet, one of the building blocks of our solar system."
  },
  {
    "name": "Space Launch System (SLS) ",
    "description": "The Space Launch System (SLS) Program will develop a heavy-lift launch vehicle to expand human presence to celestial destinations beyond low Earth orbit. This launch vehicle will be capable of lifting the Orion MPCV to asteroids, the moon, Lagrange points and, ultimately, to Mars."
  },
  {
    "name": "Wide Field Infrared Survey Telescope (WFIRST) ",
    "description": "NASA's current plans call for WFIRST to perform an extraordinarily broad set of scientific investigations: studying the newly-discovered phenomenon of dark energy, measuring the history of cosmic acceleration, completing the exoplanet census begun by NASA's Kepler Space Telescope and demonstrating technology for direct imaging and characterization of exoplanets."
  }
]

skill_json = [
  {
    "web-scraper-order": "1575731012-101",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Aeroelasticity"
  },
  {
    "web-scraper-order": "1575731012-182",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Bioinformatics and Computational Biology"
  },
  {
    "web-scraper-order": "1575731012-139",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Models"
  },
  {
    "web-scraper-order": "1575731012-111",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Finite Element Method"
  },
  {
    "web-scraper-order": "1575731012-102",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "ANOVA"
  },
  {
    "web-scraper-order": "1575731012-30",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Astronomy & Astrophysics"
  },
  {
    "web-scraper-order": "1575731012-168",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Extragalactic Astronomy"
  },
  {
    "web-scraper-order": "1575731012-297",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Gravitational Physics"
  },
  {
    "web-scraper-order": "1575731012-55",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Space"
  },
  {
    "web-scraper-order": "1575731012-250",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Chemical Engineering"
  },
  {
    "web-scraper-order": "1575731012-45",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Thin Films"
  },
  {
    "web-scraper-order": "1575731012-196",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Extrasolar Planets"
  },
  {
    "web-scraper-order": "1575731012-243",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Computational Fluid Dynamics"
  },
  {
    "web-scraper-order": "1575731012-66",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Galaxy Evolution"
  },
  {
    "web-scraper-order": "1575731012-195",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Planetary Sciences and Astrogeology"
  },
  {
    "web-scraper-order": "1575731012-31",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nanoparticles"
  },
  {
    "web-scraper-order": "1575731012-218",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Flow Cytometry"
  },
  {
    "web-scraper-order": "1575731012-125",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Polymer Chemistry"
  },
  {
    "web-scraper-order": "1575731012-42",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Astroparticle Physics"
  },
  {
    "web-scraper-order": "1575731012-275",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Galaxy"
  },
  {
    "web-scraper-order": "1575731012-224",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Space Technology for Development"
  },
  {
    "web-scraper-order": "1575731012-191",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Statistical Analysis"
  },
  {
    "web-scraper-order": "1575731012-201",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Dark Matter"
  },
  {
    "web-scraper-order": "1575731012-293",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Composite Beam Theory"
  },
  {
    "web-scraper-order": "1575731012-301",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spacecraft"
  },
  {
    "web-scraper-order": "1575731012-148",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "High Energy Physics"
  },
  {
    "web-scraper-order": "1575731012-193",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Black Holes"
  },
  {
    "web-scraper-order": "1575731012-282",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "General Relativity"
  },
  {
    "web-scraper-order": "1575731012-74",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Extrasolar Materials"
  },
  {
    "web-scraper-order": "1575731012-149",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Atoms"
  },
  {
    "web-scraper-order": "1575731012-107",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Reliability"
  },
  {
    "web-scraper-order": "1575731012-144",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Solar"
  },
  {
    "web-scraper-order": "1575731012-264",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Astrophotography"
  },
  {
     "web-scraper-order": "1575731012-227",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Modeling and Analysis Structures"
  },
  {
    "web-scraper-order": "1575731012-128",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Particle Physics"
  },
  {
    "web-scraper-order": "1575731012-216",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Radiation Detection"
  },
  {
    "web-scraper-order": "1575731012-103",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Innovation Management"
  },
  {
    "web-scraper-order": "1575731012-138",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Radiation Measurements"
  },
  {
    "web-scraper-order": "1575731012-69",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Electrical Engineering"
  },
  {
    "web-scraper-order": "1575731012-70",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Real-Time Simulation"
  },
  {
    "web-scraper-order": "1575731012-242",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Space Ethics"
  },
  {
    "web-scraper-order": "1575731012-256",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Particle Accelerators"
  },
  {
    "web-scraper-order": "1575731012-289",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Molecular Dynamics"
  },
  {
    "web-scraper-order": "1575731012-267",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Atom Science"
  },
   {
     "web-scraper-order": "1575731012-186",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Spatial Systems and Supporting"
   },
  {
    "web-scraper-order": "1575731012-169",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "ISS"
  },
   {
     "web-scraper-order": "1575731012-225",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Manufacturing Aerospace"
   },
  {
    "web-scraper-order": "1575731012-258",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Oil & Energy"
  },
  {
    "web-scraper-order": "1575731012-154",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "X-Ray Analysis"
  },
  {
    "web-scraper-order": "1575731012-141",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Stellar Structure"
  },
  {
    "web-scraper-order": "1575731012-174",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Optical Astronomy"
  },
  {
    "web-scraper-order": "1575731012-22",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Infrared Astronomy"
  },
  {
    "web-scraper-order": "1575731012-286",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Deep Learning"
  },
  {
    "web-scraper-order": "1575731012-210",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Radio Astronomy"
  },
  {
    "web-scraper-order": "1575731012-77",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Active Galactic Nuclei"
  },
  {
    "web-scraper-order": "1575731012-226",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spatial Computer Science"
  },
  {
    "web-scraper-order": "1575731012-285",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Materials Development"
  },
  {
    "web-scraper-order": "1575731012-161",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Structure Strength"
  },
  {
    "web-scraper-order": "1575731012-59",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Altitude Analysis"
  },
  {
    "web-scraper-order": "1575731012-180",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Micro & Nanocomposites"
  },
  {
    "web-scraper-order": "1575731012-277",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Heat Transfer"
  },
  {
    "web-scraper-order": "1575731012-43",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Materials Science"
  },
  {
    "web-scraper-order": "1575731012-177",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Cell Line"
  },
  {
    "web-scraper-order": "1575731012-271",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Big Data"
  },
  {
    "web-scraper-order": "1575731012-219",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Stress Measurements"
  },
  {
    "web-scraper-order": "1575731012-262",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Polymerase Chain Reaction"
  },
  {
    "web-scraper-order": "1575731012-50",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Bioinformatics"
  },
   {
     "web-scraper-order": "1575731012-99",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Structure Weight"
   },
  {
    "web-scraper-order": "1575731012-79",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Immunology"
  },
  {
    "web-scraper-order": "1575731012-179",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spatial Biotechnology"
  },
  {
    "web-scraper-order": "1575731012-291",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Scanning Electron Microscopy"
  },
  {
    "web-scraper-order": "1575731012-239",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Carbon"
  },
  {
    "web-scraper-order": "1575731012-135",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nanoparticle Research"
  },
  {
    "web-scraper-order": "1575731012-190",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "International Collaboration"
  },
   {
     "web-scraper-order": "1575731012-109",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Material Thickness of the Structure"
   },
   {
     "web-scraper-order": "1575731012-39",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Antibodies"
  },
  {
    "web-scraper-order": "1575731012-208",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Gene Expression"
  },
  {
    "web-scraper-order": "1575731012-261",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Synthesis"
  },
  {
    "web-scraper-order": "1575731012-237",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Material Characterization"
  },
  {
    "web-scraper-order": "1575731012-122",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Instruments"
  },
  {
    "web-scraper-order": "1575731012-287",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "UV-Visible Spectroscopy"
  },
  {
    "web-scraper-order": "1575731012-46",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Mechanical Engineering"
  },
  {
    "web-scraper-order": "1575731012-90",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Materials Chemistry"
  },
  {
    "web-scraper-order": "1575731012-276",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Solubility"
  },
  {
    "web-scraper-order": "1575731012-146",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Polymers"
  },
  {
    "web-scraper-order": "1575731012-235",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Electrochemistry"
  },
  {
    "web-scraper-order": "1575731012-137",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Academic Writing"
  },
  {
    "web-scraper-order": "1575731012-194",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Data Analysis"
  },
  {
    "web-scraper-order": "1575731012-245",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Protein Purification"
  },
  {
    "web-scraper-order": "1575731012-121",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Heat Analysis"
  },
  {
    "web-scraper-order": "1575731012-151",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spatial Resistance"
  },
  {
    "web-scraper-order": "1575731012-147",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "DMSO"
  },
  {
    "web-scraper-order": "1575731012-140",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Time Series"
  },
  {
    "web-scraper-order": "1575731012-126",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Conceptual Design"
  },
  {
    "web-scraper-order": "1575731012-173",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Machine Learning"
  },
  {
    "web-scraper-order": "1575731012-118",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Aerospace Stress Analyst"
   },
   {
    "web-scraper-order": "1575731012-115",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Civil Engineering"
   },
   {
    "web-scraper-order": "1575731012-83",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Advanced Statistical Analysis"
   },
   {
     "web-scraper-order": "1575731012-170",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "SPSS"
   },
   {
    "web-scraper-order": "1575731012-88",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nano"
   },
   {
    "web-scraper-order": "1575731012-272",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Material Innovation"
   },
  {
    "web-scraper-order": "1575731012-92",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Neural Networks"
  },
  {
    "web-scraper-order": "1575731012-36",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Solvents Solution"
  },
  {
    "web-scraper-order": "1575731012-132",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nano Textile"
  },
  {
    "web-scraper-order": "1575731012-48",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Calculations"
  },
  {
    "web-scraper-order": "1575731012-183",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Robotisation & Automatisation"
  },
  {
    "web-scraper-order": "1575731012-62",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Analytical Chemistry"
  },
  {
    "web-scraper-order": "1575731012-221",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Materials Extraction"
  },
  {
    "web-scraper-order": "1575731012-220",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "New Materials"
  },
  {
    "web-scraper-order": "1575731012-60",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Bacteria Analysis"
  },
  {
    "web-scraper-order": "1575731012-97",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Light Measurement"
  },
  {
    "web-scraper-order": "1575731012-284",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Glass Resistance"
  },
  {
    "web-scraper-order": "1575731012-178",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Cell Culture Techniques"
  },
  {
    "web-scraper-order": "1575731012-38",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Extractions"
  },
  {
    "web-scraper-order": "1575731012-205",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "System Modeling"
  },
  {
    "web-scraper-order": "1575731012-78",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Connectivity"
  },
  {
    "web-scraper-order": "1575731012-222",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nanotechnology"
  },
   {
     "web-scraper-order": "1575731012-159",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Laboratory Controls"
   },
  {
    "web-scraper-order": "1575731012-81",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Propulsion Engineering"
  },
  {
    "web-scraper-order": "1575731012-241",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Mechanisms of Hatch"
   },
  {
    "web-scraper-order": "1575731012-143",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Renewable Energy"
  },
  {
    "web-scraper-order": "1575731012-251",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Measurement"
  },
  {
    "web-scraper-order": "1575731012-254",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Particle"
  },
  {
    "web-scraper-order": "1575731012-124",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Water"
  },
  {
    "web-scraper-order": "1575731012-246",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Protein Expression"
  },
   {
     "web-scraper-order": "1575731012-152",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Sustainability"
  },
  {
    "web-scraper-order": "1575731012-279",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Ethanol"
  },
  {
    "web-scraper-order": "1575731012-33",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Advanced Statistics"
  },
  {
    "web-scraper-order": "1575731012-67",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "ELISA"
  },
   {
     "web-scraper-order": "1575731012-91",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Test Systems"
   },
   {
    "web-scraper-order": "1575731012-53",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Graphene"
  },
  {
    "web-scraper-order": "1575731012-145",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Space Organisms"
  },
  {
    "web-scraper-order": "1575731012-202",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "X-ray Diffraction"
  },
  {
    "web-scraper-order": "1575731012-244",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Finite Element Analysis"
  },
  {
    "web-scraper-order": "1575731012-65",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Image Processing"
  },
  {
    "web-scraper-order": "1575731012-142",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Geographic Information System"
  },
  {
    "web-scraper-order": "1575731012-73",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Materials Engineering"
  },
  {
    "web-scraper-order": "1575731012-288",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Energy"
  },
  {
    "web-scraper-order": "1575731012-198",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Theorical Physics"
  },
  {
    "web-scraper-order": "1575731012-150",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Membranes"
  },
  {
    "web-scraper-order": "1575731012-165",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Molecular Biological Techniques"
  },
  {
    "web-scraper-order": "1575731012-192",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Biochemistry"
  },
  {
    "web-scraper-order": "1575731012-207",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Scientific Research"
  },
  {
    "web-scraper-order": "1575731012-131",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Cloud Computing"
  },
  {
    "web-scraper-order": "1575731012-268",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Semiconductor"
  },
  {
    "web-scraper-order": "1575731012-187",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "DNA"
  },
  {
    "web-scraper-order": "1575731012-82",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Transfection"
  },
  {
    "web-scraper-order": "1575731012-236",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Dataset"
  },
  {
    "web-scraper-order": "1575731012-155",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Sequencing"
  },
  {
    "web-scraper-order": "1575731012-215",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Steel"
  },
  {
    "web-scraper-order": "1575731012-157",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Salts"
  },
  {
    "web-scraper-order": "1575731012-230",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Simulators"
  },
  {
    "web-scraper-order": "1575731012-281",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "DNA Sequencing"
  },
  {
    "web-scraper-order": "1575731012-252",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Space Equipment"
  },
  {
    "web-scraper-order": "1575731012-29",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Methods"
  },
  {
    "web-scraper-order": "1575731012-76",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Interpretation"
  },
  {
    "web-scraper-order": "1575731012-130",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Sensors"
  },
  {
    "web-scraper-order": "1575731012-57",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Chemistry"
  },
  {
    "web-scraper-order": "1575731012-49",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Psychology"
  },
  {
    "web-scraper-order": "1575731012-248",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "EAC"
  },
  {
    "web-scraper-order": "1575731012-94",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Fluorescence"
  },
  {
    "web-scraper-order": "1575731012-23",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Molecular Biology"
  },
  {
    "web-scraper-order": "1575731012-238",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Solar Cells"
  },
  {
    "web-scraper-order": "1575731012-75",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Brain Studies"
  },
  {
    "web-scraper-order": "1575731012-290",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Gas & Petrol"
  },
  {
    "web-scraper-order": "1575731012-206",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Neuroscience Physical"
  },
  {
    "web-scraper-order": "1575731012-64",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Organic Chemistry"
  },
  {
    "web-scraper-order": "1575731012-212",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Comsol Multiphysics"
  },
  {
    "web-scraper-order": "1575731012-259",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Molecular Cell Biology"
  },
  {
    "web-scraper-order": "1575731012-185",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Microbiology"
  },
  {
    "web-scraper-order": "1575731012-199",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "High-Performance Liquid Chromatography"
  },
  {
    "web-scraper-order": "1575731012-117",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Applied Mathematics"
  },
  {
    "web-scraper-order": "1575731012-156",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "RNA Extraction"
  },
  {
    "web-scraper-order": "1575731012-294",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Antennas"
  },
  {
    "web-scraper-order": "1575731012-257",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spatial Medicine"
  },
  {
    "web-scraper-order": "1575731012-270",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "DNA Extraction"
  },
  {
    "web-scraper-order": "1575731012-260",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Algorithms"
  },
  {
    "web-scraper-order": "1575731012-95",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Structural Equation Modeling"
  },
  {
    "web-scraper-order": "1575731012-203",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Polymerization"
  },
  {
    "web-scraper-order": "1575731012-113",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Wireless Sensor Network"
  },
  {
    "web-scraper-order": "1575731012-263",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Mouse Models"
  },
  {
    "web-scraper-order": "1575731012-300",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Battery"
  },
  {
    "web-scraper-order": "1575731012-189",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Molecular Dynamics Simulation"
  },
  {
    "web-scraper-order": "1575731012-171",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Images"
  },
   {
     "web-scraper-order": "1575731012-85",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Spatial Instructor"
   },
  {
    "web-scraper-order": "1575731012-292",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Computer"
  },
  {
    "web-scraper-order": "1575731012-176",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Mathematics"
  },
  {
    "web-scraper-order": "1575731012-110",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spatial Pressure"
  },
  {
    "web-scraper-order": "1575731012-133",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Vectorization"
  },
  {
    "web-scraper-order": "1575731012-197",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Coding"
  },
  {
    "web-scraper-order": "1575731012-283",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Qualitative Research"
  },
  {
    "web-scraper-order": "1575731012-37",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Plasmids"
  },
  {
    "web-scraper-order": "1575731012-61",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Data"
  },
  {
    "web-scraper-order": "1575731012-32",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Design Thinking"
  },
  {
    "web-scraper-order": "1575731012-63",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Graphs & Statistics"
  },
  {
    "web-scraper-order": "1575731012-96",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spatial Economics"
  },
  {
    "web-scraper-order": "1575731012-167",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Embed Software"
  },
  {
    "web-scraper-order": "1575731012-123",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "System Cloning"
  },
  {
    "web-scraper-order": "1575731012-40",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Artificial Intelligence"
  },
  {
    "web-scraper-order": "1575731012-229",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Data Mining"
  },
  {
    "web-scraper-order": "1575731012-160",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nanocomposites"
  },
  {
    "web-scraper-order": "1575731012-274",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "3D Modelisation"
  },
  {
    "web-scraper-order": "1575731012-269",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Thin Films and Nanotechnology"
  },
  {
    "web-scraper-order": "1575731012-166",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "PCR"
  },
  {
    "web-scraper-order": "1575731012-233",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Remote Sensing"
  },
  {
    "web-scraper-order": "1575731012-188",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Spatial Data Systems"
  },
  {
    "web-scraper-order": "1575731012-175",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Satellite System"
  },
  {
    "web-scraper-order": "1575731012-217",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Electrodes"
  },
  {
    "web-scraper-order": "1575731012-129",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Attachment"
  },
  {
    "web-scraper-order": "1575731012-234",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "microRNA"
  },
  {
    "web-scraper-order": "1575731012-136",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Tissue"
  },
  {
    "web-scraper-order": "1575731012-93",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Plant Extracts"
  }
]

avatar_json = [
  {
    "web-scraper-order": "1576087743-306",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/W38gzvwECGJuhjTJXrGoqx85DWCmhZirBgnUIcFMEzc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTkzNzguanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-304",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/-PpkKihOXkEvUtGkUs3ZLx5zgFUbtlmCSeaj7d9zuyU/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk1OTEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-302",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/aNQYYS0hAZyxZ0qlqKbI-bERqUBV36z8xUK5jacrLEs/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk4ODIuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-309",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/y7Bns8m4C0uAv5Du1P6xT1hlOzWrqw7LpxWZbdmTGBc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTkwNTUuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-307",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/MUQryrqYMGA36eLrLrM2Iq-5YlMGeFdBtjHLTmxSxCw/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTkzNjIuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-317",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/gkiIiKK0ks5Y4qVsSYFhElYxUDvncbX3EsVAgbJ7irM/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTgwNTcuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-327",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/az0O-t54XP7gdj0tQ_rXEfnOklBdTnTQRdEAVNq0aEo/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTcyMTYuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-330",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/x8tsW9Zw6dtnDzJ5zdySt6DN8XG7TQfJ2WSwAJOwoi8/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTcwNzEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-310",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/-o5Rg7x3-3rYPel8kUTIrBTQvLk4IeqgwU9lPpM0bmQ/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg5NjEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-320",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/9YWvScT1RgNNJ-bVW-Xd9dT71PvYJMlQZqamJjKC1FE/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTgwMDQuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-315",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/xJKi-M6Xe2tBUne7Bw0OHwsDA-r348mblWr_wPG0y_0/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg1OTMuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-313",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/ej9u9FCtLiX4aa_VLlQj4L9WkdXOxOCTCgKpGG5sGGA/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg2ODEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-321",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/ShAXZYXpiveAT79W-wkdhHltnEPSixX6Bf4sWCxii8I/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTc3NTIuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-316",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/w8CtEByVr_lAoZBYPr8N4wgAr-uf-vt9hT4LtHBV3HI/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTgxMzAuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-314",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/T14TWrXsDLz_3iAsCZKzCM_RXTuzgdYyg_4_aovptWs/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg2MzcuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-311",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/QLnNxDo8L3Rrmq7YHpEVCpCPRcgeFtOD0nematF6keE/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg4NTEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-305",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/_q3D1rdwLPmcsOHPCb5qndEWHcgOl24c7e2XI9fSmzo/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk1MTIuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-319",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/oKxcwoM3nBhSK_GX-xkAQGEECAVFZBRCsiC0kQtqveo/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTgwMTkuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-322",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/KtVmVIgEZHq26hQ5o2fIXdJU5dIj8ik0eE9Ti960UyI/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTc2MjQuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-331",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/1RqfCen6OzTwpa1Z6VcFwLpnmFzHtUa0grdPklsPFwA/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTcwMjQuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-312",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/BI_G5LclqPSCqy2mkGwAWtRP_7n_lPV5y8l_TN0Dcsw/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTg3OTUuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-324",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/B3hqpqRZKwr-ohCW-1joHaEdZwKMStrjFrg1YiELKmU/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTczMzAuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-328",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/A-c--Se7LBB5_J4TAD3aGD8qFixATj2lXG4uYZYFtHo/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTcxNTEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-329",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/vUBSMjqE1ryizGYWO2T5pq8wJgH-bHHBrJZZ9rb2_2A/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTcwNzguanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-323",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/xutQfSXqMjiqWglMGla7qfQ2qzOGeWs8AjrbwEZnTjg/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTc0MDIuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-308",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/bGrx6Ywy6yAXOmlQwyYf5WDoIILOMQkUUlGGI-ThusQ/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTkyODMuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-325",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/Z559-60WgkMvZDWr2VG_-mxxspkzjNOZ0LNck71Sjz0/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTczMjkuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-303",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/Ff4z95BhtN-zUiABugurfZv7lAEwtO7ZgNoJGhrqhw4/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTk2OTYuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-318",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/eDIzN8nagytpvzVz457tCkcfnV6eLq7jcmXFwUaPujM/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTgwNDIuanBn.jpg"
  },
  {
    "web-scraper-order": "1576087743-326",
    "web-scraper-start-url": "https://generated.photos/faces/adult#",
    "avatar": "https://images.generated.photos/opEpP9uvMuaYNKlzu-njojNlwpaM84K2vEKeaIZHElc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTczMDAuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-371",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/qLxZf8QIWxth3K6LptwsuHv-srvBtGWoIf3ZSPk1KCM/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTQyMTMuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-374",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/rsAcp-MhjJ1FheHgv8FboWulSr73a4R5I7jjiXHw0j8/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTIzNzYuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-386",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/cxCmB0vip5nDCuCI5f7zAWuWq-PihiKXwwC1fbG3nw0/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODA0NzkuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-365",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/SrnUOK3bTqassb2BtZtbacf84lQy_3bmTDQ19SHh93w/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTc2MzUuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-387",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/Zb1dr22AuWLuPhPAYo8NEAC_EBEts-UcD_REyMCtzaQ/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/Nzk3MDguanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-379",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/dBPdjdxgUTO9FCL3jKJDnHhvjr7MVDoLXPv77KtmXUM/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODcxOTEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-370",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/BT8E_uGw2plxR961uc9no-ewh0PmySTmRXS1Vyu3q0I/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTQ1NzEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-376",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/G_CN6gDeqWdzqeS1FoWnxf7caCMn8Rz3ZlLDOe9OuYk/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTA5MTYuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-362",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/HSmNPeyAEuN3MvU3Fj4WhKk8pIknSUU2aCNZ_1FTo10/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTkxODQuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-390",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/_U9A0WKAE3KQ4AkaoMR8WPAMZHHcqtzjfrANa5tJyIU/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/NzU0OTYuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-389",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/bIQKl-p-4KPlUWaKZzPX2vgX-VjPuP9eo4D3sIMBokc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/NzY3ODMuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-367",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/hOyq1OrBN3AOUM50HDAnggird2TjFtJfaSIlFiJangE/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTcxNzIuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-375",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/pmUoaO0kttTblJ0IVaMdPinQbKVpZxVKnKXm3wg7h2w/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTE4MTEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-373",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/1CRTSr_-waNlizn3hnjg0LDIUMXGpqWEv8nUY9Okda8/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTI3MDguanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-385",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/HLg7IUUTtM1efaVK2vbKYb4bFKMmEYCs9KGFLAgWWh4/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODExMzguanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-378",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/VKZaV8MTG8dH2t163om6Phmf8Uk1kDFx0nF9OfLFoZE/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODcyOTYuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-377",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/jCNIyT8axxb67-V8fYTA5VgYi9aReCMaHWJjaK3gCHI/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTA0NDEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-380",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/KoWk_W3maCjZFfnK10pEjNhYxzJy-XNjHmuBbmYwXi0/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODYxNjUuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-382",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/yH-IQaYvGEqXubkcjm_JBpdtAYV65KeXN7whsX52p6I/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODUzNTAuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-384",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/l3jiQshmZ8XIN55Wq1S7Fl0O61MbVJ60Yr948NcoZO4/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODI5MzAuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-381",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/3UOJ3BN471a4q8LMUswgi7ekZOs-styXQBLMiTdy7R4/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODYwOTEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-363",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/RQSN--OUhdYAR8zlcSkrPDwDjL9QkR7tWKQJ9m3Z99Y/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTgzOTQuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-369",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/jlFpmGlpG6Da_TTU1dLVinmK3Hu4VChU_j-WyOasAB8/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTQ2NjcuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-383",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/WGf4KOuvaYdNd1aIq_OyTbQi7UEYWlO2r9cYDXPehNs/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/ODQ1MjAuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-391",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/2jFLpH-O-6n7tnbWPYN2YQ7CBNyWfQ8dYYxLHtDaLiU/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/NzUzMjEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-372",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/liA381LsxWmsmX3_iJXrlBXQLyrwzjn-1qckiBUW5Oc/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTQxNDEuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-364",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/5TeCsXr8Cbz-3kOgXLUyBKbaHXNYPNtTc7IG4VLOg3c/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTc4NDcuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-368",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/wedeEe1ZmHaEbN01yKAIDHG86n5QcpuxCbXy7zcI-0k/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTU3OTkuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-366",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/VK_GNFXvaUwM4FGgI1EfeAUIVM02IZRAYPvpsizrxas/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/OTc0NDMuanBn.jpg"
  },
  {
    "web-scraper-order": "1576106189-388",
    "web-scraper-start-url": "https://generated.photos/faces/elderly",
    "avatar": "https://images.generated.photos/1-yBelPOMx6pWRkJPr_qUJMVML34E9uExz7kgoNBicg/rs:fit:512:512/Z3M6Ly9nZW5lcmF0/ZWQtcGhvdG9zLzA5/Nzk2NzguanBn.jpg"
  }
]


# puts list_description.count + " descriptios added and " + list_project_name + " project names"

puts "Adding functions in array"

function_json.each do |element|
  list_of_functions << element[:function]
end

# puts list_of_functions.count + " functions added"

puts "Adding skills in array"

skill_json.each do |element|
  list_of_tags << element[:skills]
end

# puts list_of_tags.count + " skills added"

puts "Adding avatar in array"

avatar_json.each do |element|
  list_of_avatars << element[:avatar]
end

# puts list_of_avatars.count + " avatar added"

puts "Adding project in array"

project_json.each do |element|
  list_project_names << element[:name]
  puts list_project_names.last
  list_descriptions << element[:description]
  puts list_descriptions.last
end


puts "creating Fla"

fla = User.new(
  fullname: "Flavien Rosellini",
  email: "flavien@feello.ws",
  password: "password",
  avatar: "flavien.png",
  phone: "0706070809",
  country: "France",
  city: "Marseille",
  function: "Materials researcher",
  school: "Mines Paristech",
  company: aerospace,
  skill_list: ['Finite Element Method', 'Galaxy', 'Statistical Analysis', 'microgravity'],
  response: Faker::Number.number(digits: 2),
  experience: "Experienced"
  )


  project1 = Project.new(
    name: "Aquapad",
    description: "The water that astronauts drink on the International Space Station (ISS) is recycled by up to 80% from their sweat, urine, and other reclaimed wastewater sources. Recycling reduces the number of supply missions needed to run the ISS, and building a self-sufficient spacecraft is necessary for future missions farther from our planet. Using a device that consists of a simple absorbent cotton, which is injected with 1 milliliter of water, and a tablet computer application, Aquapad aims to improve the speed and efficiency of water potability tests onboard the ISS.",
    status: 'In Progress',
    visibility: true,
    open_to_apply: false,
    user: fla
  )
  project1.save!

  project2 = Project.new(
    name: "KickSat-2",
    description: "Small satellites launched from space are used for a wide variety of tasks. But truly tiny satellites called ChipSats, which integrate power, computing, sensing and communication equipment onto a 3.5-centimeter-square circuit board, open up new possibilities for exploration around Earth, asteroids and other planets. The KickSat-2 mission tests 100 Sprite ChipSats demonstrating that tiny, massively distributed satellites using commercial off-the-shelf technology can work in space.",
    status: 'Done',
    visibility: true,
    open_to_apply: false,
    user: fla
  )
  project2.save!

fla.save!

laurent = User.new(
  fullname: "Laurent Dupont",
  email: "ldeguil34@gmail.com",
  password: "password",
  avatar: "laurent.jpeg",
  phone: "0606070809",
  country: "Japan",
  city: "Sapporo",
  function: "Spatial researcher",
  school: "Okkaido University",
  company: aerospace,
  skill_list: ["Spatial Resistance", "Spatial Data Systems", "Propulsion Engineering", 'Big Data', 'Spatial Biotechnology'],
  response: "80",
  experience: "Senior"
  )
laurent.save!

  project3 = Project.new(
    name: "Nodes",
    description: "The water that astronauts drink on the International Space Station (ISS) is recycled by up to 80% from their sweat, urine, and other reclaimed wastewater sources. Recycling reduces the number of supply missions needed to run the ISS, and building a self-sufficient spacecraft is necessary for future missions farther from our planet. Using a device that consists of a simple absorbent cotton, which is injected with 1 milliliter of water, and a tablet computer application, Aquapad aims to improve the speed and efficiency of water potability tests onboard the ISS.",
    status: 'In Progress',
    visibility: true,
    open_to_apply: false,
    user: laurent
  )
  project3.save!

  project4 = Project.new(
    name: "Space Country",
    description: "Small satellites launched from space are used for a wide variety of tasks. But truly tiny satellites called ChipSats, which integrate power, computing, sensing and communication equipment onto a 3.5-centimeter-square circuit board, open up new possibilities for exploration around Earth, asteroids and other planets. The KickSat-2 mission tests 100 Sprite ChipSats demonstrating that tiny, massively distributed satellites using commercial off-the-shelf technology can work in space.",
    status: 'Done',
    visibility: true,
    open_to_apply: false,
    user: laurent
  )
  project4.save!

puts 'Creating 10 fake user...'

53.times do
  user = User.new(
    fullname: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    avatar: list_of_avatars.sample,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    country: Faker::Address.country_by_code(code: 'FR'),
    city: list_of_cities.sample,
    function: list_of_functions.sample,
    school: Faker::University.name,
    company: aerospace,
    skill_list: list_of_tags.sample(rand(5..10)),
    response: Faker::Number.number(digits: 2),
    experience: ["Early Career", "Experienced", "Senior"].sample
  )

  rand(2..4).times do
    project = Project.new(
      name: list_project_names.sample,
      description: list_descriptions.sample,
      status: 'In Progress',
      visibility: true,
      open_to_apply: false,
      user: user
    )
    project.save!

    puts 'Creating projects'

  end
  user.save!
end

puts 'Users created'

puts 'Done!'

 puts "company created : #{Company.count} "
 puts "user created : #{User.count} "

# name = "Martin_Jean"  # programmer la recuperation de la saisie sur le sign up en JS
# url = "https://www.researchgate.net/profile/#{name}"
# # url = File.read("/home/deguil/Bureau/toto.html") code pour relier une page en local

# html_file = open(url).read
# html_doc = Nokogiri::HTML(url)

# skills = []

# html_doc.search('div.nova-l-flex:nth-child(2)').each do |element|
#   element.search('a:nth-child(1)').each do |elem|
#     unless elem.text.include?("Show more")
#       skill = elem.text.strip
#       # puts elem.text.strip
#     skills << skill
#   end
# end

# #scrapping avatar
# html_doc.search('div.nova-e-avatar > img:nth-child(1)').each do |element|
#   avatar = element.values.first
#   # puts avatar
#   end

# scrapping name
# html_doc.search('div.nova-e-text--spacing-xxs').each do |element|
#   name = element.text.strip
#   puts name
#   end




# puts 'Destroy Database...'

# Company.destroy_all
# User.destroy_all
# Project.destroy_all
# Collaboration.destroy_all

# puts 'Creating Database...'

# company_test = Company.create(name:"The big company")

# user_test = User.create(first_name:"John", last_name:"Lascience", country:"France", city:"Paris", function:"Fellow researcher", school:"Harvar University", phone:"+33 1 42 61 65 34", email:"john@john.com", password:"password", company_id: company_test.id)

# project_test = Project.create(name:"Hydrolic model conception", description:"We built Devise to help you quickly develop an application that uses authentication. However, we don't want to be in your way when you need to customize it.", user_id: user_test.id, status: 'In Progress', visibility: true, open_to_apply: false)

# collaboration_test = Collaboration.create(project_id: project_test.id, user_id: user_test.id, joined: 'Pending')

# puts Company.count
# puts User.count
# puts Project.count
# puts Collaboration.count

