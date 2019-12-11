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

Company.destroy_all
User.destroy_all
Project.destroy_all
Collaboration.destroy_all

list_of_functions = []
list_of_tags = []
list_description = []
list_project_name = []
list_of_avatars = []

function_json =[
  {
    "function": "Aerospace Engineering and Operations Technicians Reseacher"
  },
  {
    "function": "Architectural and Engineering Managers Reseacher"
  },
  {
    "function": "Computer Hardware Engineers Reseacher"
  },
  {
    "function": "Electrical and Electronics Engineering Technicians Reseacher"
  },
  {
    "function": "Electrical and Electronics Engineers Reseacher"
  },
  {
    "function": "Industrial Engineers Reseacher"
  },
  {
    "function": "Materials Engineers Reseacher"
  },
  {
    "function": "Mechanical Engineers Reseacher"
  },
  {
    "function": "Calculation engineer in aeronautical industry researcher Reseacher"
  },
  {
    "function": "Stress Analyst Reseacher"
  },
  {
    "function": "Supervisory Physical Scientist Reseacher"
  },
  {
    "function": "Supervisory Interdisciplinary Reseacher"
  },
  {
    "function": "Environmental Reseacher"
  },
  {
    "function": "Interdisciplinary Regulatory Project Reseacher"
  },
  {
    "function": "Engineer Reseacher"
  },
  {
    "function": "Regional Agreement State Program Officer Reseacher"
  },
  {
    "function": "Biologist Reseacher"
  },
  {
    "function": "Mathematician Reseacher"
  },
  {
    "function": "Mathematical Statistician Reseacher"
  },
  {
    "function": "Mechanical Reseacher"
  },
  {
    "function": "Mech Reseacher"
  },
  {
    "function": "Aeronautic Design Reseacher"
  },
  {
    "function": "Aerospace Stress Analyst Reseacher"
  },
  {
    "function": "Technical Support Reseacher"
  },
  {
    "function": "Appplications Integration Reseacher"
  },
  {
    "function": "Cybersecurity Reseacher"
  }
]

project_json = [
  {
    "name": "BioSentinel",
    "description​": "The BioSentinel mission was selected as one of the secondary payloads, and the sole biological experiment, to fly on the Space Launch System’s first Exploration Mission (EM-1) planned to launch in 2020. The primary objective of BioSentinel is to develop a biosensor to detect and measure the impact of space radiation on living organisms over long durations beyond Low Earth Orbit (LEO)."
  },
  {
    "name": "EcAMSat ",
    "description​": "The E. coli AntiMicrobial Satellite (EcAMSat) mission will investigate space microgravity effects on the antibiotic resistance and its genetic basis of E. coli, a bacterial pathogen responsible for urinary tract infection in humans and animals. Bacterial antibiotic resistance may pose a danger to astronauts in microgravity, where the immune response is weakened. Scientists believe that the results of this experiment could help design effective countermeasures to protect astronauts’ health during long-duration human space missions. EcAMSat is being developed through a partnership between NASA’s Ames Research Center and the Stanford University School of Medicine. EcAMSAT is slated for launch in late 2016. "
  },
  {
  "name": "PowerCell ",
  "description​": " ​In its first flight, the PowerCell Payload will investigate the performance of microbial mini-ecologies containing both photosynthetic microbes and consumer organisms. Photosynthetic cyanobacteria will produce the carbohydrate sucrose (table sugar), which will feed Bacillus subtilis, a robust bacterium commonly found in soil and the gut. "
  },
  {
    "name": "AVA ",
    "description​": "Affordable Vehicle Avionics (AVA): Common Modular Avionics System for Nano-Launchers Offering Affordable Access to Space.  NASA Ames Research Center has developed and tested a prototype low-cost avionics package for space launch vehicles that provides complete GNC functionality in a package smaller than a tissue box (100mm x 120mm x 69mm; 4in x 4.7in x 2.7in), with a mass of less than 0.84kg (2lbs). "
  },
  {
    "name": "TechEdSat-5​",
    "description​": "​In late 2016, TechEdSat-5 will launch from the International Space Station (ISS). This CubeSat will deploy an exo-brake, an exo-atmospheric drag chute that can be used for controlled de-orbit of a small payload canister from Earth orbit. This capability is useful for returning biological samples from ISS and even planetary samples from beyond Earth. TechEdSat-5 will demonstrate improved GPS tracking and a modulated exo-brake allowing more precise control of exo-atmospheric drag, re-entry time and location. It features multiple cameras to help verify exo-brake deployment and modulation. GPS tracking is anticipated to give precise orbital trajectories leading to better drag assessment and re-entry targeting among other benefits. "
  },
  {
    "name": "Nodes",
    "description​": "NASA’s Nodes satellites, a pair of tissue box-size CubeSats, launched to the International Space Station on December 6, 2015. The two Nodes satellites were deployed from the Station on May 16, 2016 to demonstrate new network capabilities critical to the operation of swarms of spacecraft. Weighing just 4.5 pounds each and measuring 4 inches by 4 inches by 6.5 inches, the Nodes satellites, once deployed, will test new network capabilities for operating swarms of spacecraft in the future. "
  },
  {
    "name": "EDSN ",
    "description​": "On November 3, 2015, the eight small satellites of the Edison Demonstration of Smallsat Networks (EDSN) mission were lost in the failure of the launch vehicle that was carrying them to orbit as secondary payloads. There will be an opportunity to complete some of the objectives of the EDSN mission in the Nodes follow-on mission. "
  },
  {
    "name": "PhoneSat",
    "description​": "​NASA's PhoneSat project tests whether spacecraft can be built using smartphones to launch the lowest-cost satellites ever flown in space. Each PhoneSat nanosatellite is one cubesat unit - a satellite in a 10 cm (approx. 4 inches) cube or about the size of a tissue box - and weighs approximately three pounds. Engineers believe PhoneSat technology will enable NASA to launch multiple new satellites capable of conducting science and exploration missions at a small fraction of the cost of conventional satellites."
  },
  {
    "name": "Exploration Ground Systems ",
    "description​": "Exploration Ground Systems' primary objective is to prepare the center to process and launch the next-generation vehicles and spacecraft designed to achieve NASA's goals for space exploration. "
  },
  {
    "name": "HEO-ESD Integration ",
    "description​": "Exploration Systems Development Division (ESD) has been charged to oversee the development of nation’s next generation of human exploration systems. ESD Responsibilities include: Provide HEO MD with insight and oversight of programs developing human exploration capabilities (MPCV, SLS, and 21st Century Ground Systems), Complete Constellation Transition during FY11, Manage cross-program integration across MPCV, SLS and 21CGS Programs (Manage interfaces between programs and cross-program risks as well as ensure cross-program integration is occurring). "
  },
  {
    "name": " International Space Station (ISS)",
    "description​": "The International Space Station is an unprecedented achievement in global human endeavors to conceive, plan, build, operate, and utilize a research platform in space. With the assembly of the space station at its completion and the support of a full-time crew of six, a new era of utilization for research has begun. "
  },
  {
    "name": "James Webb Space Telescope (JWST) ",
    "description​": "The James Webb Space Telescope is a large, infrared-optimized space telescope. Webb will probe for the \"first light\" after the Big Bang and find the first galaxies that formed in the early Universe, connecting the Big Bang to our own Milky Way Galaxy. Webb will peer through dusty clouds to see stars forming planetary systems, connecting the Milky Way to our own Solar System and look for the chemical signatures of extra-terrestrial life. "
  },
  {
    "name": "Joint Polar Satellite System-2 (JPSS-2) ",
    "description​": "JPSS-2 will provide operational continuity of satellite-based observations and products for NOAA Polar-Orbiting Environmental Satellites (POES) and Suomi NPP satellite and ground systems. The baseline plan for JPSS Ground System will be sustained to support JPSS-2, similar to JPSS-1. "
  },
  {
    "name": "Joint Polar Satellite System Ground (JPSS Ground) ",
    "description​": "The ground system for the JPSS mission is a global network of receiving stations linked to NOAA, which distributes the satellite data and derived products to users worldwide. The versatile ground system controls the spacecraft, ingests and processes data and provides information to users like NOAA's National  "
  },
  {
    "name": "Landsat 9 ",
    "description​": "Landsat 9 — a partnership between NASA and the U.S. Geological Survey — will continue the Landsat program’s critical role in monitoring, understanding and managing the land resources needed to sustain human life "
  },
  {
    "name": "Lucy ",
    "description​": "Lucy will be the first space mission to study the Trojan asteroids of Jupiter. The mission takes its name from the fossilized human ancestor (called “Lucy” by her discoverers) whose skeleton provided unique insight into humanity's evolution. Likewise, the Lucy mission will revolutionize our knowledge of planetary origins and the formation of the solar system. "
  },
  {
    "name": "Mars 2020 ",
    "description​": "Designed to advance high-priority science goals for Mars exploration, the mission would address key questions about the potential for life on Mars. The mission would also provide opportunities to gather knowledge and demonstrate technologies that address the challenges of future human expeditions to Mars.. "
  },
  {
    "name": "Multi-Purpose Crew Vehicle (Orion MPCV) ",
    "description​": "This spacecraft will serve as the primary crew vehicle for missions beyond low Earth orbit. The Orion MPCV is capable of conducting regular in-space operations (rendezvous, docking, extravehicular activity) in conjunction with payloads delivered by the Space Launch System. "
  },
  {
    "name": "Psyche ",
    "description​": "The Psyche mission is a journey to a unique metal asteroid orbiting the Sun between Mars and Jupiter. What makes the asteroid Psyche unique is that it appears to be the exposed nickel-iron core of an early planet, one of the building blocks of our solar system. "
  },
  {
    "name": "Space Launch System (SLS) ",
    "description​": "The Space Launch System (SLS) Program will develop a heavy-lift launch vehicle to expand human presence to celestial destinations beyond low Earth orbit. This launch vehicle will be capable of lifting the Orion MPCV to asteroids, the moon, Lagrange points and, ultimately, to Mars. "
  },
  {
    "name": "Wide Field Infrared Survey Telescope (WFIRST) ",
    "description​": "NASA's current plans call for WFIRST to perform an extraordinarily broad set of scientific investigations: studying the newly-discovered phenomenon of dark energy, measuring the history of cosmic acceleration, completing the exoplanet census begun by NASA's Kepler Space Telescope and demonstrating technology for direct imaging and characterization of exoplanets. "
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
    "skills": "Western Blot"
  },
  {
    "web-scraper-order": "1575731012-168",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Cell Culture"
  },
  {
    "web-scraper-order": "1575731012-297",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Food"
  },
  {
    "web-scraper-order": "1575731012-55",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Conferences"
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
    "skills": "RNA"
  },
  {
    "web-scraper-order": "1575731012-243",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Computational Fluid Dynamics"
  },
  {
    "web-scraper-order": "1575731012-66",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "pH"
  },
  {
    "web-scraper-order": "1575731012-195",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Cell Biology"
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
    "skills": "Correction"
  },
  {
    "web-scraper-order": "1575731012-275",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Mind"
  },
  {
    "web-scraper-order": "1575731012-224",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Methodology"
  },
  {
    "web-scraper-order": "1575731012-191",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Statistical Analysis"
  },
  {
    "web-scraper-order": "1575731012-201",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Mice"
  },
   {
     "web-scraper-order": "1575731012-293",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Composite Beam Theory"
   },
   {
     "web-scraper-order": "1575731012-301",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "SDA"
  },
  {
    "web-scraper-order": "1575731012-148",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Immunohistochemistry"
  },
  {
    "web-scraper-order": "1575731012-193",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Journal Impact Factor"
  },
  {
    "web-scraper-order": "1575731012-282",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Time"
  },
  {
    "web-scraper-order": "1575731012-74",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Philosophy"
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
    "skills": "Industry"
  },
   {
     "web-scraper-order": "1575731012-227",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Modeling and Analysis of Primary and Secondary Structures"
   },
  {
    "web-scraper-order": "1575731012-128",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Acids"
  },
  {
    "web-scraper-order": "1575731012-216",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Survey"
  },
  {
    "web-scraper-order": "1575731012-103",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Innovation"
  },
  {
    "web-scraper-order": "1575731012-138",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Simulink"
  },
  {
    "web-scraper-order": "1575731012-69",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Electrical Engineering"
  },
  {
    "web-scraper-order": "1575731012-70",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Real-Time PCR"
  },
  {
    "web-scraper-order": "1575731012-242",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Ethics"
  },
  {
    "web-scraper-order": "1575731012-256",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Higher Education"
  },
  {
    "web-scraper-order": "1575731012-289",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Molecular Dynamics"
  },
  {
    "web-scraper-order": "1575731012-267",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Social Science"
  },
   {
     "web-scraper-order": "1575731012-186",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Hagler Systems and Supporting"
   },
  {
    "web-scraper-order": "1575731012-169",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "ANSYS"
  },
   {
     "web-scraper-order": "1575731012-225",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "manufacturing"
   },
  {
    "web-scraper-order": "1575731012-258",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Oil"
  },
  {
    "web-scraper-order": "1575731012-154",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "XRD Analysis"
  },
  {
    "web-scraper-order": "1575731012-141",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Next Generation Sequencing"
  },
  {
    "web-scraper-order": "1575731012-174",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Teaching"
  },
  {
    "web-scraper-order": "1575731012-22",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "MATLAB"
  },
  {
    "web-scraper-order": "1575731012-286",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Deep Learning"
  },
  {
    "web-scraper-order": "1575731012-210",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Drugs"
  },
  {
    "web-scraper-order": "1575731012-77",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Publishing"
  },
  {
    "web-scraper-order": "1575731012-226",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Computer Science"
  },
  {
    "web-scraper-order": "1575731012-285",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Soil Science"
  },
  {
    "web-scraper-order": "1575731012-253",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Manuscripts"
  },
   {
     "web-scraper-order": "1575731012-161",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Structure Strength"
   },
  {
    "web-scraper-order": "1575731012-59",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Attitude"
  },
  {
    "web-scraper-order": "1575731012-180",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Articles"
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
    "web-scraper-order": "1575731012-162",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Journalism"
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
    "web-scraper-order": "1575731012-119",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Program"
  },
  {
    "web-scraper-order": "1575731012-219",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Stress"
  },
  {
    "web-scraper-order": "1575731012-104",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Classification"
  },
  {
    "web-scraper-order": "1575731012-56",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Concrete"
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
    "web-scraper-order": "1575731012-44",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Publications"
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
    "skills": "Biotechnology"
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
    "web-scraper-order": "1575731012-47",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Staining"
  },
  {
    "web-scraper-order": "1575731012-41",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Academic Journals"
  },
  {
    "web-scraper-order": "1575731012-135",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nanoparticle Research"
  },
  {
    "web-scraper-order": "1575731012-190",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Collaboration"
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
    "web-scraper-order": "1575731012-34",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Publication"
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
    "web-scraper-order": "1575731012-231",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Training"
  },
  {
    "web-scraper-order": "1575731012-46",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Mechanical Engineering"
  },
  {
    "web-scraper-order": "1575731012-80",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Gels"
  },
  {
    "web-scraper-order": "1575731012-90",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Materials Chemistry"
  },
  {
    "web-scraper-order": "1575731012-164",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Papers"
  },
  {
    "web-scraper-order": "1575731012-276",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Solubility"
  },
  {
    "web-scraper-order": "1575731012-214",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Plants"
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
    "web-scraper-order": "1575731012-240",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "SDS-PAGE"
  },
  {
    "web-scraper-order": "1575731012-228",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Powders"
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
    "web-scraper-order": "1575731012-278",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Peptides"
  },
  {
    "web-scraper-order": "1575731012-121",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Heat"
  },
  {
    "web-scraper-order": "1575731012-151",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Resistance"
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
    "web-scraper-order": "1575731012-181",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Filing"
  },
  {
    "web-scraper-order": "1575731012-92",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Neural Networks"
  },
  {
    "web-scraper-order": "1575731012-58",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "FLUENT"
  },
  {
    "web-scraper-order": "1575731012-36",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Solvents"
  },
  {
    "web-scraper-order": "1575731012-132",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Nanomaterials"
  },
  {
    "web-scraper-order": "1575731012-48",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Calculations"
  },
  {
    "web-scraper-order": "1575731012-183",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Buffer"
  },
  {
    "web-scraper-order": "1575731012-62",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Analytical Chemistry"
  },
  {
    "web-scraper-order": "1575731012-35",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Research Papers"
  },
  {
    "web-scraper-order": "1575731012-221",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Extraction"
  },
  {
    "web-scraper-order": "1575731012-220",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Materials"
  },
  {
    "web-scraper-order": "1575731012-60",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Bacteria"
  },
  {
    "web-scraper-order": "1575731012-97",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Light"
  },
  {
    "web-scraper-order": "1575731012-284",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Glass"
  },
  {
    "web-scraper-order": "1575731012-178",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Cell Culture Techniques"
  },
  {
    "web-scraper-order": "1575731012-38",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Extracts"
  },
  {
    "web-scraper-order": "1575731012-205",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Modeling"
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
     "skills": "Control of Laboratory Controls"
   },
  {
    "web-scraper-order": "1575731012-81",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Engineering"
  },
   {
     "web-scraper-order": "1575731012-280",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Laboratory Control Analysis"
   },
   {
     "web-scraper-order": "1575731012-72",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Mechanical Engineering"
   },
   {
     "web-scraper-order": "1575731012-241",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Mechanisms of Hatch"
   },
  {
    "web-scraper-order": "1575731012-158",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Botany"
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
     "web-scraper-order": "1575731012-298",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Training"
   },
  {
    "web-scraper-order": "1575731012-152",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Sustainability"
  },
  {
    "web-scraper-order": "1575731012-51",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Websites"
  },
  {
    "web-scraper-order": "1575731012-279",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Ethanol"
  },
  {
    "web-scraper-order": "1575731012-33",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Statistics"
  },
  {
    "web-scraper-order": "1575731012-249",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Informality"
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
    "web-scraper-order": "1575731012-106",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Bioinformatic Tools"
  },
  {
    "web-scraper-order": "1575731012-105",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "English"
  },
  {
    "web-scraper-order": "1575731012-145",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Organic"
  },
  {
    "web-scraper-order": "1575731012-213",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Matrix"
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
    "web-scraper-order": "1575731012-54",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Free Will"
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
    "skills": "Physics"
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
    "web-scraper-order": "1575731012-127",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Dyes"
  },
  {
    "web-scraper-order": "1575731012-184",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Questionnaire"
  },
  {
    "web-scraper-order": "1575731012-112",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Business"
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
    "web-scraper-order": "1575731012-273",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Social Media"
  },
  {
    "web-scraper-order": "1575731012-211",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Sample Size"
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
    "web-scraper-order": "1575731012-68",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Assays"
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
    "web-scraper-order": "1575731012-209",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Plating"
  },
   {
     "web-scraper-order": "1575731012-252",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Space Equipment"
   },
  {
    "web-scraper-order": "1575731012-266",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Plant Biotechnology"
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
    "web-scraper-order": "1575731012-116",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Fungi"
  },
  {
    "web-scraper-order": "1575731012-172",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Reasoning"
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
    "web-scraper-order": "1575731012-98",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "References"
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
    "skills": "Brain"
  },
  {
    "web-scraper-order": "1575731012-52",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Climate Change"
  },
  {
    "web-scraper-order": "1575731012-108",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Enzymes"
  },
  {
    "web-scraper-order": "1575731012-290",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Gas"
  },
  {
    "web-scraper-order": "1575731012-134",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Programming in MATLAB"
  },
  {
    "web-scraper-order": "1575731012-26",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Publisher"
  },
  {
    "web-scraper-order": "1575731012-223",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Ecology"
  },
  {
    "web-scraper-order": "1575731012-24",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Books"
  },
  {
    "web-scraper-order": "1575731012-87",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Soil"
  },
   {
     "web-scraper-order": "1575731012-265",
     "web-scraper-start-url": "https://www.researchgate.net/topics",
     "skills": "Eurocom"
   },
  {
    "web-scraper-order": "1575731012-206",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Neuroscience"
  },
  {
    "web-scraper-order": "1575731012-64",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Organic Chemistry"
  },
  {
    "web-scraper-order": "1575731012-89",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Coating"
  },
  {
    "web-scraper-order": "1575731012-296",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Internet of Things"
  },
  {
    "web-scraper-order": "1575731012-153",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Journal Articles"
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
    "web-scraper-order": "1575731012-295",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Health"
  },
  {
    "web-scraper-order": "1575731012-257",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Medicine"
  },
  {
    "web-scraper-order": "1575731012-247",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Genetics"
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
    "web-scraper-order": "1575731012-100",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Soil Analysis"
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
    "web-scraper-order": "1575731012-28",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Running"
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
    "web-scraper-order": "1575731012-163",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Abaqus"
  },
  {
    "web-scraper-order": "1575731012-200",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Proteins"
  },
  {
    "web-scraper-order": "1575731012-110",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Pressure"
  },
  {
    "web-scraper-order": "1575731012-114",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Environmentalism"
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
    "web-scraper-order": "1575731012-299",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Liquids"
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
    "skills": "Thinking"
  },
  {
    "web-scraper-order": "1575731012-63",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Graphs"
  },
  {
    "web-scraper-order": "1575731012-96",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Economics"
  },
  {
    "web-scraper-order": "1575731012-120",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Protein Purification Techniques"
  },
  {
    "web-scraper-order": "1575731012-167",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Software"
  },
  {
    "web-scraper-order": "1575731012-255",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Biology"
  },
  {
    "web-scraper-order": "1575731012-123",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Cloning"
  },
  {
    "web-scraper-order": "1575731012-40",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Artificial Intelligence"
  },
  {
    "web-scraper-order": "1575731012-25",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Writing"
  },
  {
    "web-scraper-order": "1575731012-86",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Regression"
  },
  {
    "web-scraper-order": "1575731012-84",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Research Topics"
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
    "skills": "3D"
  },
  {
    "web-scraper-order": "1575731012-269",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Thin Films and Nanotechnology"
  },
  {
    "web-scraper-order": "1575731012-71",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Python"
  },
  {
    "web-scraper-order": "1575731012-27",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Learning"
  },
  {
    "web-scraper-order": "1575731012-204",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Indexes"
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
    "web-scraper-order": "1575731012-232",
    "web-scraper-start-url": "https://www.researchgate.net/topics",
    "skills": "Color"
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
  }
]

feellows = Company.create(name: 'Feellows')

function_json.each do |element|
  list_of_functions << element[:function]
end

project_json.each do |element|
  list_project_name << element[:name]
  list_description << element[:description​]
end

skill_json.each do |element|
  list_of_tags << element[:skills]
end

avatar_json.each do |element|
  list_of_avatars << element[:avatar]
end

puts "creating John"

fla = User.new(
  fullname: "Flavien Rosellini",
  email: "flavien@feellows.com",
  password: "password",
  avatar: "flavien.png",
  phone: "0706070809",
  country: "France",
  city: "Marseille",
  function: "Materials researcher",
  school: "Mines Paristech",
  company: feellows,
  skill_list: list_of_tags.sample(rand(5..10)),
  response: Faker::Number.number(digits: 2),
  experience: "Experienced"
  )
fla.save!

puts 'Creating 10 fake user...'

10.times do
  user = User.new(
    fullname: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    avatar: list_of_avatars.sample,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    country: Faker::Address.country,
    city: Faker::Address.city,
    function: list_of_functions.sample,
    school: Faker::University.name,
    company: feellows,
    skill_list: list_of_tags.sample(rand(5..10)),
    response: Faker::Number.number(digits: 2),
    experience: ["Early Career", "Experienced", "Senior"].sample
  )
  user.save!


  2.times do
    project = Project.new(
    name: list_project_name.sample,
    description: list_description.sample,
    status: 'In Progress',
    visibility: true,
    open_to_apply: false,
    user: user
    )
    project.save!
  end
end

puts 'Finished!'

 puts "company created : #{Company.count} "
 puts "user created : #{User.count} "


#            ---------------  Blocs For Scrapping --------------

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

#        ------------------------------------------------------
