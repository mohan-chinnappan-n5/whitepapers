# Building Audiences for LWR-Based Experience Cloud Sites


The **Audiences** feature in Salesforce Experience Cloud allows administrators to segment users and deliver personalized experiences dynamically. For **Lightning Web Runtime (LWR)-based sites**, Audiences remains a powerful tool to tailor content, branding, and functionality, despite LWR’s lightweight and performance-focused architecture. This guide explores how to build and apply Audiences in LWR sites, highlighting key differences from Aura-based sites, setup steps, and best practices.

---

## Audiences in LWR Context
In LWR-based Experience Cloud sites, Audiences functions similarly to its role in Aura-based sites but is optimized for LWR’s server-side rendering (SSR) and static site generation (SSG) capabilities. Audiences enables personalization by associating specific user attributes (e.g., profile, role, location) with tailored page variations, branding sets, or component visibility—all while maintaining LWR’s hallmark speed and scalability.

### Key Points
- **Supported in Enhanced LWR Sites**: Audiences is fully available in "Enhanced LWR" templates (e.g., "Build Your Own (LWR)") managed via Experience Builder. It’s not natively supported in code-first "Microsites," which require custom logic for personalization.
- **Performance Focus**: LWR’s lightweight nature means personalization must balance customization with load-time efficiency.
- **Public vs. Authenticated Users**: Audiences works best with authenticated users (logged-in) but can leverage limited attributes (e.g., location, device type) for unauthenticated visitors.

---

## How Audiences Work in LWR Sites
Audiences in LWR sites rely on Salesforce user data and conditions to determine what content a user sees. The process leverages Experience Builder’s no-code interface and integrates with LWR’s rendering engine to deliver personalized experiences efficiently.

### Core Capabilities
1. **Page Variations**: Show different versions of a page (e.g., homepage) based on Audience criteria.
2. **Component Visibility**: Control which components (e.g., banners, forms) appear for specific Audiences.
3. **Branding Sets**: Apply audience-specific themes (e.g., colors, logos) to reflect user segments.
4. **Server-Side Delivery**: LWR pre-renders personalized content on the server, ensuring fast load times.

---

## Steps to Build Audiences for LWR Sites

### Step 1: Set Up Your LWR Site
- **Action**: Create an Enhanced LWR site in Experience Cloud.
  - Navigate to **Setup > Experience Builder** and select "New Site."
  - Choose the "Build Your Own (LWR)" template or another Enhanced LWR option.
- **Note**: Audiences isn’t natively supported in microsites; use Enhanced LWR for this feature.

### Step 2: Define Audience Criteria
- **Action**: In Experience Builder, go to **Settings > Audiences** and click "New Audience."
- **Criteria Options**:
  - **User Fields**: Profile, role, email domain, custom fields (e.g., "Customer Type").
  - **Location**: Country, region (IP-based for unauthenticated users).
  - **Device**: Desktop, mobile, tablet.
  - **Logic**: Combine conditions with "and/or" rules (e.g., "Profile = Partner AND Country = USA").
- **Example**: Create an Audience called "VIP Customers" with criteria: "Profile = Customer AND Account Tier = Platinum."

### Step 3: Create Personalized Content
- **Page Variations**:
  - In Experience Builder, open a page (e.g., Home).
  - Click "Add Variation," design the variant, and assign it to an Audience (e.g., "VIP Customers" see a premium homepage).
- **Component Visibility**:
  - Select a component (e.g., a promo banner), go to its properties, and set "Visible to Audience" to a specific group (e.g., "VIP Customers").
- **Branding Sets**:
  - Go to **Settings > Branding**, create a new Branding Set (e.g., gold theme for VIPs), and link it to an Audience.

### Step 4: Preview and Test
- **Action**: Use Experience Builder’s preview mode to simulate different Audiences.
  - Select a user profile or criteria set to see how the site renders.
- **Tip**: Test authenticated (logged-in) and unauthenticated (guest) scenarios to ensure fallback behavior.

### Step 5: Publish the Site
- **Action**: Click "Publish" in Experience Builder to deploy the site.
- **Note**: LWR pre-renders content server-side based on Audience rules, ensuring fast delivery at runtime.

---

## Practical Examples

### Example 1: Customer Support Portal
- **Goal**: Tailor a public support site for different customer tiers.
- **Setup**:
  - Audience 1: "Standard Users" (Profile = Customer, Tier = Basic) → Basic FAQ page.
  - Audience 2: "Premium Users" (Profile = Customer, Tier = Premium) → Enhanced FAQ + live chat component.
- **Outcome**: Premium users get a richer experience without sacrificing load speed.

### Example 2: Regional Marketing Site
- **Goal**: Show localized content to unauthenticated visitors.
- **Setup**:
  - Audience 1: "US Visitors" (Location = United States) → US pricing page.
  - Audience 2: "EU Visitors" (Location = Europe) → EU pricing page with GDPR notice.
- **Outcome**: Region-specific content boosts relevance and compliance.

### Example 3: Partner Resource Hub
- **Goal**: Differentiate content for partner types.
- **Setup**:
  - Audience 1: "Certified Partners" (Role = Partner, Certification = Yes) → Advanced training page.
  - Audience 2: "New Partners" (Role = Partner, Certification = No) → Onboarding page.
- **Outcome**: Partners see role-appropriate resources seamlessly.

---

## Benefits of Audiences in LWR Sites
1. **Personalization at Scale**: Deliver tailored experiences to thousands or millions of users efficiently.
2. **Performance Preservation**: LWR’s server-side rendering ensures personalization doesn’t compromise speed.
3. **No-Code Flexibility**: Admins can manage Audiences without developer intervention.
4. **Dynamic Adaptation**: Content adjusts in real-time as user attributes change (e.g., tier upgrades).

---

## Challenges and Considerations
1. **Limited Guest Data**: Unauthenticated users offer fewer attributes (e.g., no profile), restricting Audience granularity.
2. **Component Constraints**: LWR has fewer standard components than Aura, so custom LWCs may be needed for complex personalization.
3. **Static vs. Dynamic Balance**: Overuse of dynamic Audience rules can reduce SSG benefits—use static fallbacks for public pages where possible.
4. **Testing Overhead**: Multiple Audiences require thorough testing to avoid overlap or errors.

---

## Best Practices for LWR Audiences
1. **Keep It Simple**: Limit Audiences to key segments (e.g., 3-5) to maintain manageability and performance.
2. **Leverage User Data**: Use Salesforce CRM fields (e.g., Account Type) for precise targeting.
3. **Optimize for Speed**: Minimize component-heavy variations; prioritize lightweight designs.
4. **Default Experience**: Set a fallback page or theme for users not matching any Audience (e.g., guest users).
5. **Monitor Analytics**: Use Experience Cloud dashboards to track Audience engagement and refine rules.

---

## Conclusion
Building Audiences for LWR-based Experience Cloud sites combines the power of personalization with LWR’s performance-driven architecture. By defining clear segments, creating targeted content, and testing rigorously, organizations can deliver fast, relevant experiences to diverse users—whether customers, partners, or public visitors. While LWR’s lightweight nature imposes some constraints, its integration with Experience Builder and Audiences ensures a balance of speed and customization that’s ideal for modern digital portals.

---
