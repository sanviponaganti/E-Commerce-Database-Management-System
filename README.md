# OnlineShopping Database System

This database schema powers an e-commerce platform managing customers, vendors, products, shopping carts, orders, and logistics.

## 📂 File Structure

```text
E- commerce management system/
│
├── Database Diagrams/       
├── Tables Creation.sql      
├── Data Insertion.sql    
├── Queries.sql            
├── Procedures.sql        
├── Functions.sql         
├── Triggers.sql             
├── Views.sql              
└── README.md                
```

## 💾 Database Structure & Seed Data
* `Tables Creation.sql` - Core database architecture initializing 17 relational entities including customers, vendors, multi-tiered geolocations, products, invoices, and shopping carts.
* `Data Insertion.sql` - Populates the architecture with 30 sample records mapping realistic global customer locations, cross-border vendor configurations, products, order chains, and user reviews.

---

## 📊 Analytical Queries (`Queries.sql`)
* `Query 1` - Generates a detailed breakdown of all historical orders with customer names, items purchased, quantities, and totals.
* `Query 2` - Aggregates and displays the absolute lifetime total units sold for every single product cataloged.
* `Query 3` - Performs an outer join to display courier assignments alongside tracking IDs, revealing inactive courier partnerships.
* `Query 4` - Performs high-level platform analytics summarizing totals, averages, and extreme purchase benchmarks across all historical orders.
* `Query 5` - Identifies premium product categories maintaining a calculated average price index exceeding 2000.00.
* `Query 6` - Isolates high-value "Elite" customers whose lifetime platform spend exceeds the global average order value.
* `Query 7` - Flattens complex relational spatial data to generate comprehensive delivery shipping address books for customers.
* `Query 8` - Ranks platform merchants in descending order based on gross structural marketplace sales revenue.
* `Query 9` - Partitions and ranks customers by their lifetime spending specifically localized within their respective countries.
* `Query 10` - Computes the simple global flat average pricing structure across the available categories.
* `Query 11` - Evaluates logistics operational pipelines by counting total shipments handled and tracking transit longevity.
* `Query 12` - Analyzes bulk buying behavior against consumer satisfaction metrics by correlating item batch volumes with review patterns.
* `Query 13` - Isolates dead zones by flagging registered regional municipalities that have never generated an active order.
* `Query 14` - Monitors immediate system traffic by counting the exact volume of transactional checkouts processed today.
* `Query 15` - Duplicates the revenue auditing logic of Query 8 to confirm merchant distribution rankings.

---

## ⚙️ Stored Procedures (`Procedures.sql`)
* `PlaceCustomerOrder` - Transacts safety checkouts by validating inventory stock limits before generating a locked order profile.
* `RestockProduct` - Modifies physical logistics layers by incrementally adding incoming unit shipments to existing vendor inventory stocks.
* `AddProductToCart` - Initializes or appends items to a customer's shopping cart while cleanly incrementing existing selections.
* `RegisterNewVendor` - Protects relational structural constraints by validating unique mail requirements prior to vendor onboarding.
* `UpdateTrackingDetails` - Modifies core tracking properties to update delivery pipelines when couriers change routes.

---

## 🧮 User-Defined Functions (`Functions.sql`)
* `GetTotalCustomerSpend` - Calculates the gross historical currency amount processed by a specific customer ID.
* `GetAverageProductRating` - Returns the aggregated decimal rating score for a specific vendor product based on review loops.
* `GetTotalItemsInCart` - Tallies the absolute volumetric item count resting inside a customer's active shopping cart.
* `CalculateTotalOrderValue` - Sums the subtotal items linked to an invoice to provide an overall transaction total.
* `GetCustomerAge` - Computes the dynamic relative chronological age of a platform user based on their stored date of birth.

---

## ⚡ Automated Triggers (`Triggers.sql`)
* `trg_RestockOnOrderCancellation` - Automatically restores product inventory totals when ordered items are deleted.
* `trg_UpdateStockAfterSale` - Deducts merchant inventory levels automatically when a new product purchase entry occurs.
* `trg_ValidateReviewRating` - Sanitizes incoming consumer review data by rejecting ratings outside the standard 1 to 5 scale.
* `trg_PreventDuplicateCartProduct` - Intercepts redundant entry attempts to merge duplicates into a single quantity update.
* `trg_EnforceValidAgeSignUp` - Implements age verification rules by rejecting account creation for users under 13 years old.

---

## 👁️ Database Views (`Views.sql`)
* `vw_ActiveInventoryDashboard` - Provides a live inventory monitoring screen complete with automated status flags like 'Low Stock Warning'.
* `vw_VendorPerformanceMetrics` - Aggregates gross revenues, volumetric counts, and average star reviews into a clean merchant report.
* `vw_CustomerOrderInvoices` - Flattens customer tracking data to display customer invoice slips.
* `vw_ActiveCustomerShoppingBaskets` - Maps items currently left unpurchased in active shopping carts to help analyze abandoned checkouts.
* `vw_ProductReviewSummary` - Compiles feedback metrics to show global review counts and scores per product catalog entry.
