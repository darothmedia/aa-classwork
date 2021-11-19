import React from "react";
import BenchIndex from "./bench_index";
import BenchMap from "./bench_map";

const Search = ({benches, fetchBenches}) => (
  <div>
    <BenchIndex benches={benches} fetchBenches={fetchBenches} />
    <BenchMap benches={benches} />
  </div>
);

export default Search