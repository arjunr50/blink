part of 'package:blink/features/product/presentation/bloc/product_bloc.dart';

@RoutePage()
class ProductSearchPage extends StatefulWidget implements AutoRouteWrapper {
  const ProductSearchPage({super.key, required this.products});

  final List<Product> products;

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<ProductBloc>(), child: this);
  }
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<List<Product>> _filteredProductsNotifier = ValueNotifier(
    [],
  );
  late List<Product> _allProducts;

  String _selectedCategory = 'All';
  double _minRating = 0.0;
  String _sortBy = 'name';
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    _allProducts = List.from(widget.products);
    _filteredProductsNotifier.value = List.from(_allProducts);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    _applyFilters();
  }

  void _applyFilters() {
    List<Product> filtered = _allProducts;

    if (_searchController.text.isNotEmpty) {
      final searchTerm = _searchController.text.toLowerCase();
      filtered = filtered
          .where(
            (product) =>
                product.title?.toLowerCase().contains(searchTerm) == true ||
                product.description?.toLowerCase().contains(searchTerm) ==
                    true ||
                product.id.toString().contains(searchTerm),
          )
          .toList();
    }

    if (_selectedCategory != 'All') {
      filtered = filtered
          .where((product) => product.category == _selectedCategory)
          .toList();
    }

    filtered = filtered
        .where((product) => (product.rating?.rate ?? 0) >= _minRating)
        .toList();

    filtered = _sortProducts(filtered);

    _filteredProductsNotifier.value = filtered;
  }

  List<Product> _sortProducts(List<Product> products) {
    products.sort((a, b) {
      int comparison = 0;
      switch (_sortBy) {
        case 'name':
          comparison = (a.title ?? '').compareTo(b.title ?? '');
          break;
        case 'price':
          comparison = (a.price ?? 0).compareTo(b.price ?? 0);
          break;
        case 'rating':
          comparison = (a.rating?.rate ?? 0).compareTo(b.rating?.rate ?? 0);
          break;
      }
      return _sortAscending ? comparison : -comparison;
    });
    return products;
  }

  Set<String> _getCategories() {
    final categories = _allProducts
        .map((p) => p.category ?? 'Uncategorized')
        .toSet();
    return {'All', ...categories};
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Filter & Sort',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            const TextView(text: 'Category', fontWeight: FontWeight.bold),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _getCategories()
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: TextView(text: category),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                _selectedCategory = value!;
                _applyFilters();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
            const TextView(text: 'Minimum Rating', fontWeight: FontWeight.bold),
            Slider(
              value: _minRating,
              min: 0,
              max: 5,
              divisions: 5,
              label: _minRating.toStringAsFixed(1),
              onChanged: (value) {
                _minRating = value;
                _applyFilters();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
            const TextView(text: 'Sort By', fontWeight: FontWeight.bold),
            DropdownButtonFormField<String>(
              value: _sortBy,
              items: [
                const DropdownMenuItem(
                  value: 'name',
                  child: TextView(text: 'Name'),
                ),
                const DropdownMenuItem(
                  value: 'price',
                  child: TextView(text: 'Price'),
                ),
                const DropdownMenuItem(
                  value: 'rating',
                  child: TextView(text: 'Rating'),
                ),
              ],
              onChanged: (value) {
                _sortBy = value!;
                _applyFilters();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _sortAscending,
                  onChanged: (value) {
                    _sortAscending = value!;
                    _applyFilters();
                    Navigator.pop(context);
                  },
                ),
                const Text('Ascending Order'),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _clearAllFilters() {
    _searchController.clear();
    _selectedCategory = 'All';
    _minRating = 0.0;
    _sortBy = 'name';
    _sortAscending = true;
    _applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: const Color(0xfffdfbfb),
        title: "Search Products",
        hasBack: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomTextField(
              hintText: "Search by name, description, ID...",
              enabled: true,
              controller: _searchController,
              prefixIcon: kSearch,
            ),
          ),
          ValueListenableBuilder<List<Product>>(
            valueListenable: _filteredProductsNotifier,
            builder: (context, filteredProducts, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${filteredProducts.length} products found'),
                    Row(
                      children: [
                        if (_selectedCategory != 'All' ||
                            _minRating > 0 ||
                            _searchController.text.isNotEmpty)
                          TextButton(
                            onPressed: _clearAllFilters,
                            child: const Text('Clear All'),
                          ),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: _showFilterBottomSheet,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: ValueListenableBuilder<List<Product>>(
              valueListenable: _filteredProductsNotifier,
              builder: (context, filteredProducts, _) {
                return filteredProducts.isEmpty
                    ? const Center(child: Text('No products found'))
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.7,
                            ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return GestureDetector(
                            onTap: () {
                              context.pushRoute(
                                ProductDetailRoute(product: product),
                              );
                            },
                            child: ProductCard(product: product),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _filteredProductsNotifier.dispose();
    super.dispose();
  }
}
