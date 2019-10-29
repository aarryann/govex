/// <reference types="cypress" />
// @ts-check
describe("Signin", () => {
  beforeEach(function() {
    cy.visit("/");
  });
  it("01-LA001: should focus on the email input field", function() {
    cy.focused().should("have.attr", "name", "username");
  });
  it("02-LA001: sets auth cookie when logging in via form submission", () => {
    cy.get('input[name="username"]')
      .type("jane@be.com")
      .get('input[name="password"]')
      .type("12345678{enter}");

    cy.url().should("include", "/pipeline");
    cy.contains("h4", "Pipeline").should("be.visible");

    cy.getCookie("sid").should("exist");
  });
  it("03-LA001: clears cookie on logout", function() {
    cy.get('input[name="username"]')
      .type("jane@be.com")
      .get('input[name="password"]')
      .type("12345678{enter}");
    cy.getCookie("sid").should("exist");
    cy.get("#profileDropdown").click();
    cy.get("a[href='/logout']").click();
    cy.getCookie("sid").should("not.exist");
  });
  it("04-LA001: invalid username or password", function() {});
  it("05-LA001: account locked after 3 failed attempts", function() {});
  it("06-LA001: unable to visit protected pages without signin", function() {});
});
