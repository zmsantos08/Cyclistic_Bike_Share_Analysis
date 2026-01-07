# “The Sunday Explorer vs. The Monday Commuter”: Closing the Membership Gap

Complete report [here](https://zmsantos08.github.io/Cyclistic_Bike_Share_Analysis/)

Presentation [here](https://docs.google.com/presentation/d/1zPJjSpF919dl1g38yZpMrmKigfDHsK0ZfWOnwxA1K8s/edit?usp=sharing)

## Project Overview
This project was completed as part of the Google Data Analytics Professional Certificate Capstone. The objective was to understand how annual members and casual riders use bikes differently.
These insights serve as the foundation for a new marketing strategy aimed at converting casual riders into long-term annual members.

## Data
The analysis uses Divvy's (Chicago's public bike-share system) historical trip data between Jan-Nov of 2025, which is public data made available by Motivate International Inc, click [here](https://divvybikes.com/data-license-agreement) to view the agreement.

**Data Schema:**

<img width="767" height="617" alt="image" src="https://github.com/user-attachments/assets/4b5c4aa9-8218-4884-8383-d9ca185ac40c" />

## Tools used
**SQL (BigQuery):** Used for large-scale data cleaning and transformation. Click [here](https://github.com/zmsantos08/Cyclistic_Bike_Share_Analysis/blob/3750159ce86dd296b505e5bc9a447c0e7c81ad16/Cyclistic_SQLCode.sql) for the full SQL Script

**R / Quarto:** Used for EDA, visualizations and generating the final report, available [here](https://zmsantos08.github.io/Cyclistic_Bike_Share_Analysis/)

**Google Slides:** Presentation available [here](https://docs.google.com/presentation/d/1zPJjSpF919dl1g38yZpMrmKigfDHsK0ZfWOnwxA1K8s/edit?usp=sharing)

## Key Findings

### Seasonality: Member vs. Casual (2025)

<img width="670" height="484" alt="image" src="https://github.com/user-attachments/assets/1399a36c-7709-4420-880a-fa7353be84b2" />

We found:
Bike demand exhibits strong seasonality, with a significant peak during the summer months and a sharp contraction in winter.
While both segments are weather-dependent, member usage remains notably more resilient year-round, whereas casual ridership shows much higher volatility in response to seasonal changes.


### Weekly/Daily Activity Patterns: Member vs. Casual (2025)
<img width="673" height="378" alt="image" src="https://github.com/user-attachments/assets/1a6f4715-9937-4b1f-abca-85ed74732bdd" />

We found:
Routine vs. Recreation: Members primarily use the service for the Monday to Friday daily commute, creating sharp usage spikes at 8:00 AM and 5:00 PM.
Conversely, Casual riders use bikes significantly more during the weekends and whose activity builds slowly throughout the day. Casual riders also show interest during the week, but mostly after work hours (4:00 PM - 6:00 PM)

### Top 200 Routes: Casuals (2025)

<img width="660" height="436" alt="image" src="https://github.com/user-attachments/assets/eb627644-1887-4f46-9ade-8fe05d326f40" />

We found:
Casual ridership is heavily concentrated along the lakeshore, forming a high-intensity long corridor between East Solidarity Drive and West Fullerton Avenue.
This recreational pattern is anchored by primary clusters at Navy Pier and DuSable Lake Shore Dr & Monroe St, reflecting a strong preference for scenic, coastal routes.

### Top 200 Routes: Members (2025)

<img width="652" height="435" alt="image" src="https://github.com/user-attachments/assets/6664fc94-e440-4e15-9afe-f5656ed6ff61" />

We found:
Contrary to casual users who ride for longer (avg. 20 min) by the lakeside, member routes are shorter (avg. 12 min) and concentrated in three strategic urban hubs: a Southern cluster in Hyde Park, a Center cluster at West Loop Gate, and a Northern cluster near West Fullerton Avenue.
This spatial distribution highlights a “spoke-and-hub” transit model, where the network serves as a link between established residential neighborhoods and the city’s primary commercial and institutional cores.

### Top 10 Hot Spots for Casual Riders (2025)
<img width="694" height="490" alt="image" src="https://github.com/user-attachments/assets/90037048-845a-46cc-a19c-c28744682edf" />

We found:
Despite the main goal being a digital marketing campaign, we saw value in adding the preferred hubs of casual users, if not used for located ads, it’s still relevant information for the casual user profile that can be leveraged for digital campaigns.
Top casual rider hubs identified: DuSable Lake Shore Dr & Monroe St (59,130 visits) and Navy Pier (54,061 visits).

### Bike Preferences (%): Member vs. Casual (2025)

<img width="676" height="485" alt="image" src="https://github.com/user-attachments/assets/5a61ee27-b879-41d3-8cfd-eaf84a6f178e" />

We found:
Both groups demonstrate a strong preference for electric bikes, which represents 63% for members and 65% for casual riders.
Classic bike usage is significant, with one-third of total rides, indicating that while new technology leads in volume, the traditional fleet remains a significant component of the business.

###  Average Ride Length per Bike Type: Member vs. Casual (2025)

<img width="680" height="483" alt="image" src="https://github.com/user-attachments/assets/98e4825b-c17c-419e-bc16-80c28ea9a1f3" />

We found:
Casual riders have significantly higher average trip duration compared to Members, across both bike categories.
The most pronounced gap occurs in classic bike usage (29.4 min vs. 13.6 min), suggesting that members prioritize efficiency and transit, while casual riders utilize the fleet for longer periods of time.

### Ride Length Segments: Member vs. Casual (2025)

<img width="681" height="477" alt="image" src="https://github.com/user-attachments/assets/56cfce13-d134-4a8f-a5ba-7fb8b3381036" />

We found:
Usage patterns indicate that Members favor efficiency, with 74% of under 6 min. trips attributed to this segment.
In contrast, Casual riders are significantly more likely to engage in extended use, outperforming Members in both the ‘Extended Ride’ (61%) and ‘Day Trip’ (76%) categories.
These results are consistent with the much higher average of ride length for casuals (20 min.), compared to members (12.2 min).

The main findings can be condensed in this table, which accurately describes both rider's profiles:

<img width="613" height="459" alt="image" src="https://github.com/user-attachments/assets/fd5c8680-adf3-4534-8581-4d268318f4d7" />


## Recommendations

Our recommendations for the marketing strategy can be summarized in this diagram:

<img width="719" height="543" alt="image" src="https://github.com/user-attachments/assets/cc4f9055-52eb-4ba2-87c2-f56d7a9a2a91" />




Author
Miguel Santos
