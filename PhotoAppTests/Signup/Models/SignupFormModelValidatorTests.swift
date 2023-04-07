//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Sergey Kargopolov on 2020-02-26.
//  Copyright © 2020 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // MARK: First Name Validation Unit Tests
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isFirstNameValid =
        sut.isFirstNameValid(firstName: "Jess")
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE but returned FALSE")
    }
    
    func testSignFormModelValidator_WhenTooShortFirstNameIsProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isFirstNameValid =
        sut.isFirstNameValid(firstName: "J")
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenTooLongNameProvided_ShouldReturnFalse(){
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "JessJessJess")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than  \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: Last Name Validation Unit Tests
    func testSignFormModelValidator_WhenLastNameIsProvided_ShouldReturnTrue(){
      
        let isLastNameValid = sut.isLastNameValid(lastName: "Luna")
        
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned true but returned FALSE")
    }
    
    func testSignFormModelValidator_WhenLastNameIsTooShort_ShouldReturnFalse() {
        let isLastNameValid = sut.isLastNameValid(lastName: "L")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a Last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenLastNameIsTooLong_ShouldReturnFalse() {
        let isLastNameValid = sut.isLastNameValid(lastName: "LunaLunaLunaLuna")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: Email Validation Unit Tests
    
    func testSignFormModelValidator_WhenValidEmailisProvided_ShouldReturnTrue() {
        let isEmailValid = sut.isEmailValid(email: "jessica@me")
        
        XCTAssertTrue(isEmailValid, "Provided Email is valid")
    }
    
    func testSignFormModelValidator_WhenValidPasswordIsProvided_ShouldReturnTrue() {
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned true but returned FALSE")
    }
    
    func testSignFormModelValidator_WhenPasswordIsTooShort_ShouldReturnFalse() {
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) characters but it has returned TRUE")
    
    }
    
    func testSignFormModelValidator_WhenPasswordisTooLong_ShouldReturnFalse() {
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "the doPasswordsMatch() should have returned TRUE but it returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234568")
        // Assert
        XCTAssertFalse(doPasswordsMatch, "the doPasswordsMatch() should have returned FALSE, but it has returned TRUE")
    }
}
