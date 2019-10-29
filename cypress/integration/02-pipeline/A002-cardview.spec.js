/// <reference types="cypress"/>
// @ts-check
describe("Pipeline Card view", () => {
  before(function() {
    cy.visit("/");
    cy.request("POST", "/auth/login", {
      email: "jane@be.com",
      password: "12345678"
    });
    cy.visit("/pipeline");
  });
  it("01-LA002: should display list of my opportunities in default sort order selected", () => {
    cy.get('[data-testid="entity-card"]').should("have.length.greaterThan", 1);
  });
  it("02-LA002: should display message on no results", () => {});
  it("03-LA002: should display to opportunity details on click of opportunity", () => {});
  it("04-LA002: should check for proper rating symbol", () => {});
  it("05-LA002: should display count of results", () => {});
  it("06-LA002: should not display horizontal scrollbar", () => {
    cy.window().then(win => {
      expect(win.document.body.scrollWidth).to.be.lte(win.innerWidth);
    });
  });
  it("07-LA002: should display highlight indicator for the opportunities", () => {});
  it("08-LA002: should check for proper date formats", () => {});
  it("09-LA002: should display total unread notifications indicator for an opportunity", () => {});
  it("10-LA002: should display 'Unknown' for unknown RFP dates", () => {});
  it("11-LA002: should apply selected filtering when sorting", () => {});
  it("12-LA002: should display loading symbol when results being fetched", () => {});
  it("13-LA002: should sort on selected criteria", () => {});
  it("14-LA002: should apply selected sorting when filtering", () => {});
  it("15-LA002: should not allow invalid characters or values on filter", () => {});
  it("16-LA002: should filter on selected criteria", () => {});
  it("17-LA002: show blocking message on search with no filter", () => {});
  it("18-LA002: should refresh results on cancelling filter", () => {});
  it("19-IA002-A003: should provide option to add a new opportunity", () => {
    // Check whether Add new button exists
    // Check whether new form appears when Add new button clicked
  });
  it("20-LA002: should lazy load more results on scrolling", () => {});
  it("21-LA002: should be able to switch view mode between card view, tabular view or bucket view", () => {});
  it("22-LA002: should allow option to retain last view mode selection within a session", () => {});
  it("23-LA002: should limit Opportunity name to 20 characters with tooltip and expandable view", () => {});
  it("24-FA002: should reactively add or remove opportunities from list", () => {});
  it("25-LA002: should be able to view all open opportunities", () => {});
  it("26-LA002: should be able to view all closed opportunities", () => {});
  it("27-LA002: should be able to view my closed opportunities", () => {});
});
