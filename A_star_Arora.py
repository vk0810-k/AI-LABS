from collections import deque

class QuesGraph:

    def __init__(self, adjacency_list):
        self.adjacency_list = adjacency_list

    def get_neighbors(self, v):
        return self.adjacency_list[v]

    def h(self, n): # heuristic 
        H = {
            'A': 1,
            'B': 10,
            'C': 1,
            'D': 1
        }

        return H[n]

    def A_Star_Algo(self, first, stop_node):

        open = set([first])
        closed = set([])

        g = {}

        g[first] = 0

        parent = {}
        parent[first] = first

        while len(open) > 0:
            n = None

            for v in open:
                if n == None or g[v] + self.h(v) < g[n] + self.h(n):
                    n = v;

            if n == None:
                print('Path does not exist!')
                return None


            if n == stop_node:
                reconst_path = []

                while parent[n] != n:
                    reconst_path.append(n)
                    n = parent[n]

                reconst_path.append(first)

                reconst_path.reverse()

                print('Path found: {}'.format(reconst_path))
                return reconst_path

            for (m, weight) in self.get_neighbors(n):

                if m not in open and m not in closed:
                    open.add(m)
                    parent[m] = n
                    g[m] = g[n] + weight


                else:
                    if g[m] > g[n] + weight:
                        g[m] = g[n] + weight
                        parent[m] = n

                        if m in closed:
                            closed.remove(m)
                            open.add(m)

            open.remove(n)
            closed.add(n)

        print('Path does not exist!')
        return None
    
adjacency_list = {
    'A': [('B', 1), ('C', 3), ('D', 7)],
    'B': [('D', 5)],
    'C': [('D', 12)]
}
graph1 = QuesGraph(adjacency_list)
graph1.A_Star_Algo('A', 'D')