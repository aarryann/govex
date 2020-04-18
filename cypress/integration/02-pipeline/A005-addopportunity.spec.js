/// <reference types="cypress"/>
// @ts-check
describe("Add opportunity", () => {
  beforeEach(function() {
    cy.visit("/pipeline");
  });
  it("01-LA005: should not accept duplicate opportunity names", () => {});
  it("02-LA005: should meet opportunity name constraints", () => {
    // Should not accept characters other than alphanumeric and space
    // Should not accept less than 5 characters or more than 200 characters
  });
  it("03-LA005: should hide/cancel new form when Esc key pressed or clicked outside new form.", () => {});
  it("04-LA005: should not retain the last values when add cancelled and clicked again", () => {});
});
