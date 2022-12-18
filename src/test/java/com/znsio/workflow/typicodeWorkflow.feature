@prod
Feature: Create and Update User Posts

  Background:
    * def userId = generateRandomNumber(4)
    * def title = generateAlphaNumericRandomString(10)
    * def body = generateAlphaNumericRandomString(50)
    * def newTitle = generateAlphaNumericRandomString(10)
    * def expectedTemplate = read('classpath:com/znsio/templates/schema.json')

  @createUpdatePost
  Scenario: Create a User post and then Update its title
    Given def createPost = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_createPost', {"userId": userId, "title": title, "body": body}).response
    Then karate.log('response : ' + createPost)
    And match createPost == expectedTemplate.expectedCreatePostsResponse

    * def id = createPost.userId
    Given def fetchPosts = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getPost', {"userId": id}).response
    Then match fetchPosts.userId == userId
    And match fetchPosts.title == title
    And match fetchPosts.body == body

    Given def updatePost = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_updatePost', {"title": newTitle}).response
    Then karate.log('response : ' + updatePost.response)
    And match updatePost == expectedTemplate.expectedUpdatePostsResponse

    Given def fetchPosts = karate.call('classpath:com/znsio/templates/typicodeTemplates.feature@t_getPost', {"userId": id}).response
    Then match fetchPosts.title == newTitle