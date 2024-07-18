use std::collections::HashMap;

impl Solution {
    pub fn critical_connections(n: i32, connections: Vec<Vec<i32>>) -> Vec<Vec<i32>> {
        let mut graph: HashMap<i32, Vec<i32>> = HashMap::new();
        for connection in &connections {
            graph.entry(connection[0]).or_default().push(connection[1]);
            graph.entry(connection[1]).or_default().push(connection[0]);
        }

        let mut disc = vec![-1; n as usize]; 
        let mut low = vec![-1; n as usize];   
        let mut time = 0;                    
        let mut res = vec![];                

        fn dfs(
            u: i32, parent: i32, graph: &HashMap<i32, Vec<i32>>, disc: &mut Vec<i32>, 
            low: &mut Vec<i32>, time: &mut i32, res: &mut Vec<Vec<i32>>
        ) {
            let u_usize = u as usize;
            disc[u_usize] = *time;
            low[u_usize] = *time;
            *time += 1;

            if let Some(neighbors) = graph.get(&u) {
                for &v in neighbors {
                    if disc[v as usize] == -1 { 
                        dfs(v, u, graph, disc, low, time, res);
                        low[u_usize] = low[u_usize].min(low[v as usize]);
                        if low[v as usize] > disc[u_usize] {
                            res.push(vec![u, v]);
                        }
                    } else if v != parent { 
                        low[u_usize] = low[u_usize].min(disc[v as usize]);
                    }
                }
            }
        }

        for i in 0..n {
            if disc[i as usize] == -1 {
                dfs(i, -1, &graph, &mut disc, &mut low, &mut time, &mut res);
            }
        }

        res
    }
}
