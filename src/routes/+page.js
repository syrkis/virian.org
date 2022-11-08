import * as axios from "axios";

export async function load() {
  const { data } = await axios.get("https://data.virian.org");
  return data;
}