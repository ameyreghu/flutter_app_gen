import '../core/app_data_config_model.dart';

final mockAppDataConfig = AppDataConfigModel(
  appName: "JDF DEMO APP",
  appVersion: "1.0.0",
  intialRoute: "/home",
  routes: ["/home", "/details", "/listing"],
  themeConfig: ThemeConfig(
    primaryColor: "#FF5733",
    secondaryColor: "#33FF57",
    backgroundColor: "#FFFFFF",
    textColor: "#000000",
    isDarkMode: false,
  ),
  screens: [
    Screen(
      title: "Home Screen",
      key: "home_screen",
      routeName: "/home",
      type: "base",
      initialState: {
        "carouselData": [
          {
            "text": 'Sensex Down by 2%',
            "image":
                'https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
          {
            "text": 'Breakthrough in GenAI',
            "image":
                'https://images.unsplash.com/photo-1538131587570-641359811581?q=80&w=2155&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          },
        ],
        "data": [
          {
            "title": "Market Overview",
            "icon": "trending_down",
            "stats": "Sensex Down by 2%",
          },
          {
            "title": "Market Overview",
            "icon": "trending_up",
            "stats": "Sensex Down by 2%",
          },
          {
            "title": "Market Overview",
            "icon": "trending_down",
            "stats": "Sensex Down by 2%",
          },
        ],
      },
      drawerConfig: DraweConfig(
        config: {
          "drawerItems": [
            {"title": "Home", "icon": "home", "route": "/home"},
            {"title": "Details", "icon": "info", "route": "/details"},
            {"title": "Listing", "icon": "info", "route": "/listing"},
          ],
        },
      ),
      components: [
        Component(type: "carousel", params: {"dataKey": "carouselData"}),
        Component(type: "list", params: {"dataKey": "data"}),
      ],
    ),
    Screen(
      title: "Mock Forms",
      key: "details_screen",
      routeName: "/details",
      type: "form",
      initialState: {
        "formData": {
          "title": "",
          "name": "",
          "email": "",
          "phone": "",
          "address": "",
          "terms": false,
        },
      },
      components: [
        Component(
          type: "text",
          params: {"content": "This is the Forms Example"},
        ),
        Component(
          type: "dropdown",
          params: {
            "label": "Title",
            "options": [
              {"label": "Mr", "value": "mr"},
              {"label": "Mrs", "value": "mrs"},
              {"label": "Ms", "value": "ms"},
            ],
            "placeholder": "Select your title",
            "dataKey": "title",
          },
        ),
        Component(
          type: "input",
          params: {
            "label": "Name",
            "placeholder": "Enter your name",
            "dataKey": "name",
          },
        ),
        Component(
          type: "input",
          params: {
            "label": "Email",
            "placeholder": "Enter your email",
            "dataKey": "email",
          },
        ),
        Component(
          type: "input",
          params: {
            "label": "Phone",
            "placeholder": "Enter your phone",
            "dataKey": "phone",
          },
        ),
        Component(
          type: "input",
          params: {
            "label": "Address",
            "placeholder": "Enter your address",
            "dataKey": "address",
          },
        ),
        Component(
          type: "checkbox",
          params: {
            "label": "I agree to the terms and conditions",
            "dataKey": "terms",
          },
        ),
        Component(
          type: 'button',
          params: {"label": "Submit", "action": "submit"},
        ),
      ],
    ),
    Screen(
      title: 'Listing Example',
      key: 'listing1',
      routeName: '/listing',
      type: 'listing',
      initialState: {"data": []},
      intialAction: {
        "type": "fetch",
        "url": "https://jsonplaceholder.typicode.com/posts",
        "method": "GET",
        "dataKey": "data",
      },
      components: [Component(type: 'list', params: {
        'dataKey': 'data',
        'itemExtractor':{
          'title':'title',
          "subtitle":"body",
          "id":"id"

        }
      })],
    ),
  ],
);
