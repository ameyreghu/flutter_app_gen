export const mockConfig = {
    appName: 'JDF POC1',
    appVersion: '0.0.1',
    description: 'This is a mock config for JDF POC1',
    initialRoute: 'home',
    routes: [
        'home',
        'home2',
        'listing1',
        'listing2',
        'form1',
        'form2'
    ],
    theme:{
        primary: '#007BFF',
    },
    screens: [
        {
            type: 'dashboard',
            route: 'home',
            title: 'Home',
            bottomNavigaton: [
                {
                    label: 'Home',
                    icon: 'home',
                },
                {
                    label: 'Reports',
                    icon: 'assessment'
                },
                {
                    label: 'Showcase',
                    icon: 'show-chart',

                }
            ],
            pages: [
                {
                    type: 'base',
                    components: [
                        {
                            type: 'carousel',
                            data: [
                                { text: 'Sensex Down by 2%', image: 'https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' },
                                { text: 'Breakthough in Genai', image: 'https://images.unsplash.com/photo-1538131587570-641359811581?q=80&w=2155&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' },
                            ]
                        },
                        {
                            type: 'text',
                            text: 'Welcome to JDF',
                            style: {
                                fontSize: 20,
                                fontWeight: 'bold',
                                marginBottom: 10,
                                marginTop:20,
                                alignSelf: 'flex-start',
                                padding: 10
                            }
                        },
                        {
                            type: 'cardGroup',
                            cardData: {
                                style:{
                                    //color:'#fff'
                                },
                                containerStyle:{
                                    // backgroundColor:'grey'
                                },
                                data:[
                                {
                                    text: 'Total Portfolio Value',
                                    icon: 'account-balance-wallet',
                                    stats: '$2,500,000'
                                },
                                {
                                    text: 'Daily Gains',
                                    icon: 'trending-up',
                                    stats: '$5,000',
                                },
                                {
                                    text: 'Active Investors',
                                    icon: 'group',
                                    stats: '1,200',
                                },
                                {
                                    text: 'Monthly Revenue',
                                    icon: 'attach-money',
                                    stats: '$50,000',
                                },
                                {
                                    text: 'Pending Withdrawals',
                                    icon: 'hourglass-empty',
                                    stats: '$15,000',
                                },
                                {
                                    text: 'New Investments',
                                    icon: 'show-chart',
                                    stats: '$100,000',
                                }
                            ]}
                        }
                    ]

                },
                {
                    type: 'listing',
                    title: 'Listing 1',
                    initialState: {
                        data: []
                    },
                    initAction: {
                        apiUrl: 'https://jsonplaceholder.typicode.com/posts',
                        method: 'GET'
                    },
                    components: [
                        {
                            type: 'text',
                            text: 'Recent News',
                            style: {
                                fontSize: 20,
                                fontWeight: 'bold',
                                marginBottom: 10,
                                alignSelf: 'flex-start',
                                padding: 10
                            }
                        },
                        {
                            type: 'list',
                            dataKey: 'data',
                            itemComponent: {
                                type: 'tile',
                                titleKey: 'title',
                                idKey: 'id',
                                bodyKey: 'body',
                                style: {
                                    fontSize: 16,
                                    fontWeight: 'bold',
                                    marginBottom: 10,
                                    alignSelf: 'center',
                                    padding: 10
                                }
                            },
                        }
                    ]
                },
                {
                    type: 'base',
                    components: [
                        {
                            type: 'text',
                            text: 'Welcome to JDF POC1',
                            style: {
                                fontSize: 20,
                                fontWeight: 'bold',
                                marginBottom: 10,
                                alignSelf: 'center',
                                padding: 10
                            }
                        },
                        {
                            type: 'button',
                            text: 'Go To Listing 1',
                            action: {
                                type: 'navigate',
                                route: 'listing1'
                            }
                        },
                        {
                            type: 'button',
                            text: 'Go To Listing 2',
                            action: {
                                type: 'navigate',
                                route: 'listing2'
                            }
                        },
                        {
                            type: 'button',
                            text: 'Loan Opeing Form',
                            action: {
                                type: 'navigate',
                                route: 'form1'
                            }
                        },
                        {
                            type: 'button',
                            text: 'Deposit Opeing Form',
                            action: {
                                type: 'navigate',
                                route: 'form2'
                            }
                        }
                    ]
                }
            ],
            components: [
                {
                    type: 'text',
                    text: 'Welcome to JDF POC1',
                    style: {
                        fontSize: 20,
                        fontWeight: 'bold',
                        marginBottom: 10,
                        alignSelf: 'center',
                        padding: 10
                    }
                },
            ]
        },
        {
            type: 'base',
            route: 'home2',
            title: 'Home',
            components: [
                {
                    type: 'text',
                    text: 'Welcome to JDF POC1',
                    style: {
                        fontSize: 20,
                        fontWeight: 'bold',
                        marginBottom: 10,
                        alignSelf: 'center',
                        padding: 10
                    }
                },
                {
                    type: 'text',
                    text: 'Json Declarative Framework',
                    style: {
                        fontSize: 12,
                        fontWeight: 'normal',
                        marginBottom: 10,
                        alignSelf: 'center',
                        padding: 10
                    }
                },
                {
                    type: 'button',
                    text: 'Go To Listing 1',
                    action: {
                        type: 'navigate',
                        route: 'listing1'
                    }
                },
                {
                    type: 'button',
                    text: 'Go To Listing 2',
                    action: {
                        type: 'navigate',
                        route: 'listing2'
                    }
                },
                {
                    type: 'button',
                    text: 'Loan Opeing Form',
                    action: {
                        type: 'navigate',
                        route: 'form1'
                    }
                },
                {
                    type: 'button',
                    text: 'Deposit Opeing Form',
                    action: {
                        type: 'navigate',
                        route: 'form2'
                    }
                }
            ]
        },
        {
            type: 'form',
            route: 'form1',
            title: 'Open Loan',
            initialState: {
                name: '',
                email: '',
                nic: '',
                phone: '',
                amount: '',
                terms: false
            },
            components: [
                {
                    type: 'text',
                    text: 'Open Loan',
                    style: {
                        fontSize: 20,
                        fontWeight: 'bold',
                        marginBottom: 10,
                        alignSelf: 'center',
                        padding: 10
                    }
                },
                {
                    type: 'input',
                    inputMode: 'text',
                    label: 'Name',
                    placeholder: 'Enter your name',
                    stateKey: 'name'
                },
                {
                    type: 'input',
                    inputMode: 'email',
                    label: 'Email',
                    placeholder: 'Enter your email',
                    stateKey: 'email'
                },
                {
                    type: 'input',
                    inputMode: 'text',
                    label: 'NIC',
                    placeholder: 'Enter your nic',
                    stateKey: 'nic'
                },
                {
                    type: 'input',
                    inputMode: 'numeric',
                    label: 'Phone',
                    placeholder: 'Enter your phone',
                    stateKey: 'phone'
                },
                {
                    type: 'input',
                    inputMode: 'numeric',
                    label: 'Amount',
                    placeholder: 'Enter your amount',
                    stateKey: 'amount'
                },
                {
                    type: 'checkbox',
                    label: 'I agree to the terms and conditions',
                    stateKey: 'terms'
                },
                {
                    type: 'button',
                    text: 'Submit',
                    action: {
                        type: 'formSubmit',
                        url: '/api/submit',
                        method: 'POST'
                    }
                },

            ]
        },
        {
            type: 'form',
            route: 'form2',
            title: 'Open Fixed Deposit',
            initialState: {
                name: '',
                email: '',
                nic: '',
                phone: '',
                amount: '',
                ageDeclartion: false,
                terms: false
            },
            components: [
                {
                    type: 'text',
                    text: 'Open Fixed Deposit',
                    style: {
                        fontSize: 20,
                        fontWeight: 'bold',
                        marginBottom: 10,
                        alignSelf: 'center',
                        padding: 10
                    }
                },
                {
                    type: 'input',
                    label: 'Name',
                    placeholder: 'Enter your name',
                    stateKey: 'name'
                },
                {
                    type: 'input',
                    label: 'Email',
                    placeholder: 'Enter your email',
                    stateKey: 'email'
                },
                {
                    type: 'checkbox',
                    label: 'I am of leagal age',
                    stateKey: 'ageDeclartion'
                },
                {
                    type: 'input',
                    label: 'NIC',
                    placeholder: 'Enter your nic',
                    stateKey: 'nic'
                },
                {
                    type: 'input',
                    label: 'Phone',
                    placeholder: 'Enter your phone',
                    stateKey: 'phone'
                },
                {
                    type: 'input',
                    label: 'Amount',
                    placeholder: 'Amount you want to deposit',
                    stateKey: 'amount'
                },
                {
                    type: 'checkbox',
                    label: 'I agree to the terms and conditions',
                    stateKey: 'terms'
                },
                {
                    type: 'button',
                    text: 'Submit',
                    action: {
                        type: 'formSubmit',
                        url: '/api/submit',
                        method: 'POST'
                    }
                },

            ]
        },
        {
            type: 'listing',
            route: 'listing1',
            title: 'Listing 1',
            initialState: {
                data: []
            },
            initAction: {
                apiUrl: 'https://jsonplaceholder.typicode.com/posts',
                method: 'GET'
            },
            components: [
                {
                    type: 'text',
                    text: 'Basic Listing 1',
                    style: {
                        fontSize: 20,
                        fontWeight: 'bold',
                        marginBottom: 10,
                        alignSelf: 'center',
                        padding: 10
                    }
                },
                {
                    type: 'list',
                    dataKey: 'data',
                    itemComponent: {
                        type: 'tile',
                        titleKey: 'title',
                        idKey: 'id',
                        bodyKey: 'body',
                        style: {
                            fontSize: 16,
                            fontWeight: 'bold',
                            marginBottom: 10,
                            alignSelf: 'center',
                            padding: 10
                        }
                    },
                }
            ]
        },
        {
            type: 'listing',
            route: 'listing2',
            title: 'Listing 2',
            initialState: {
                data: []
            },
            initAction: {
                apiUrl: 'https://jsonplaceholder.typicode.com/todos',
                method: 'GET'
            },
            components: [
                {
                    type: 'text',
                    text: 'Basic Listing 1',
                    style: {
                        fontSize: 20,
                        fontWeight: 'bold',
                        marginBottom: 10,
                        alignSelf: 'center',
                        padding: 10
                    }
                },
                {
                    type: 'list',
                    dataKey: 'data',
                    itemComponent: {
                        type: 'tile',
                        titleKey: 'title',
                        idKey: 'id',
                        bodyKey: 'body',
                        style: {
                            fontSize: 16,
                            fontWeight: 'bold',
                            marginBottom: 10,
                            alignSelf: 'center',
                            padding: 10
                        }
                    },
                }
            ]
        }
    ]
};