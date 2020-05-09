import React from 'react';
import ReactDOM from 'react-dom';
import ApolloClient from "apollo-boost";
import {ApolloProvider} from 'react-apollo';
import CertApplication from "../src/components/CertApplication/CertApplication.jsx"
// import {hashHistory, IndexRoute} from "react-router";

const client = new ApolloClient({
    uri: "/api/graphql"
});

const Root = () => (
    <ApolloProvider client={client}>
        <CertApplication/>
    </ApolloProvider>
);

ReactDOM.render(
    <Root/>, document.querySelector('#root')
);
